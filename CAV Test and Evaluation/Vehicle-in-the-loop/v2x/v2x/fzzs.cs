using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using VISSIMLIB;//vissim引用
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;
using System.Data.SqlClient;//连接Sql数据库
using System.Text.RegularExpressions;
using System.IO;
using arithmetic;

namespace v2x
{
    public partial class 仿真展示 : Form
    {
        public bool startFlag;//初始化运行指令
        public bool fileopen = false;//路网加载是否完成
        public bool startFlag1;//时钟标志 控制单步运行

        [DllImport("user32.dll", EntryPoint = "SetParent")]//导入设置父窗体函数
        public static extern int SetParent(IntPtr hWndChild, IntPtr hWndNewParent);
        [DllImport("user32.dll ", EntryPoint = "ShowWindow")]
        public static extern int ShowWindow(IntPtr hwnd, int nCmdShow);
        [DllImport("user32.dll", SetLastError = true)]
        private static extern bool MoveWindow(IntPtr hwnd, int x, int y, int cx, int cy, bool repaint);
        [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
        public static extern IntPtr GetForegroundWindow();

        public DataSet DS = new DataSet();
        public SqlDataAdapter sda;//SQL适配器


        public void InitialVissim()//初始化路网
        {
            simu1.vissim = new Vissim();

            if (simu1.vissim != null)
            {
                simu1.vissim.LoadNet(Convert.ToString(simu1.path));
            }

        }
        public 仿真展示()
        {
            InitializeComponent();
        }
        private void fzzs1_Load(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (fileopen == false)
            {
                fileopen = true;
                startFlag = true;//已加载路网
                OpenFileDialog openfileddialog = new OpenFileDialog();
                openfileddialog.InitialDirectory = "D://";
                openfileddialog.Filter = "(*.inp, *.inpx) | *.inp; *.inpx;| All files(*.*) | *.* ";
                openfileddialog.FilterIndex = 1;
                if (openfileddialog.ShowDialog() == DialogResult.OK)
                {
                    simu1.path = openfileddialog.FileName;
                }
                InitialVissim();//调用InitialVissim函数
                Thread.Sleep(1000);//等候1s抓取屏幕
                IntPtr handle = GetForegroundWindow();
                var frm = Control.FromHandle(handle);//实例为窗体

                SetParent(handle, panel1.Handle);
                MoveWindow(handle, 0, 0, panel1.Width, panel1.Height, true);
                simu1.sim = simu1.vissim.Simulation;
                simu1.net = simu1.vissim.Net;
                simu1.vehicles = simu1.net.Vehicles;
                simu1.itemTimeStep = 1;
                //传回仿真设置原数据
                textBox16.Text = Convert.ToString(simu1.sim.AttValue["SimPeriod"]);
                textBox14.Text = Convert.ToString(simu1.sim.AttValue["SimRes"]);//仿真精度
                textBox15.Text = Convert.ToString(simu1.sim.AttValue["SimSpeed"]);//仿真速度
                textBox13.Text = Convert.ToString(simu1.sim.AttValue["SimBreakAt"]); //中断时刻

                //更新数据库内车辆输入部分
                try
                {
                    foreach (IVehicleInput ip in simu1.net.VehicleInputs)
                    {
                        foreach (ITimeIntervalVehVolume it in ip.TimeIntVehVols)
                        {
                            V2XDataSet.VehicleinputRow newinputRow;
                            newinputRow = v2XDataSet.Vehicleinput.NewVehicleinputRow();
                            newinputRow.ID = Convert.ToInt32(ip.AttValue["No"]);
                            newinputRow.Link = Convert.ToInt32(ip.AttValue["Link"]);
                            newinputRow.volume = Convert.ToInt32(it.AttValue["Volume"]);
                            if (Convert.ToString(it.AttValue["TimeInt"]) == "1-1") { newinputRow.StartT = 0; newinputRow.EndT = 900; }
                            else if (Convert.ToString(it.AttValue["TimeInt"]) == "1-2") { newinputRow.StartT = 900; newinputRow.EndT = 1800; }
                            else if (Convert.ToString(it.AttValue["TimeInt"]) == "1-3") { newinputRow.StartT = 1800; newinputRow.EndT = 2700; }
                            else if (Convert.ToString(it.AttValue["TimeInt"]) == "1-4") { newinputRow.StartT = 2700; newinputRow.EndT = 3600; }
                            else {; }
                            this.v2XDataSet.Vehicleinput.Rows.Add(newinputRow);
                        }
                    }
                    this.vehicleinputTableAdapter.Update(this.v2XDataSet.Vehicleinput);
                    this.vehicleinputTableAdapter.Fill(this.v2XDataSet.Vehicleinput);

                }
                catch {; }
            }
            else { MessageBox.Show("已经加载路网"); }
        }


        public void runsingle()//单步仿真
        {

            for (; simu1.itemTimeStep <= this.progressBar1.Maximum;)//按步仿真
            {
                System.Windows.Forms.Application.DoEvents();
                if (startFlag && startFlag1)
                {
                    startFlag1 = false;
                    timer2.Start();

                    simu1.sim.RunSingleStep();
                    simu1.itemTimeStep++;
                    this.progressBar1.Visible = true;
                    this.progressBar1.Value++;
                    textBox10.Text = Convert.ToString(simu1.sim.AttValue["SimSec"]);
                    #region vehicle2车辆数据清空
                    vehicle2.clear();//清空数据
                    #endregion
                    foreach (IVehicle vehicle in simu1.vehicles)
                    {
                        #region vehicle2 车辆数据储存
                        vehicle2.communi(vehicle);//传回数据
                        #endregion//这部分值均能传回
                        //读取vehicle1数据
                        #region 读取本车数据作为目标
                        if (vehicle.AttValue["No"] == vehicle1.id11)
                        {

                            String Front = Convert.ToString(vehicle.AttValue["CoordFront"]);
                            String Rear = Convert.ToString(vehicle.AttValue["CoordRear"]);
                            string[] k = Front.Split(' ');
                            vehicle1.frontx = Convert.ToDouble(k[0]);
                            vehicle1.fronty = Convert.ToDouble(k[1]);
                            k = Rear.Split(' ');
                            vehicle1.rearx = Convert.ToDouble(k[0]);
                            vehicle1.reary = Convert.ToDouble(k[1]);
                            vehicle1.v_s = vehicle.AttValue["SPEED"];
                            vehicle1.a_s = vehicle.AttValue["Acceleration"];
                            vehicle1.laneid11 = Convert.ToInt16(Convert.ToString(vehicle.AttValue["LANE"].Split('-')[1]));
                            vehicle1.linkid11 = Convert.ToInt16(Convert.ToString(vehicle.AttValue["LANE"].Split('-')[0]));
                            vehicle1.coord11 = vehicle.AttValue["Pos"];

                        }
                        #endregion
                    }
                    #region 算法插入
                    if (checkBox2.CheckState == CheckState.Checked)//如果用户选择插入算法
                    {
                        vehicle2.sf();
                        #region 数组及车辆遍历 传回数据
                        for (int j = 0; j < vehicle2.ID.Count(); j++)
                        {
                            foreach (IVehicle ve in simu1.vehicles)
                            {
                                if (ve.AttValue["No"] == vehicle2.ID[j])
                                {
                                    if (ve.AttValue["No"] == vehicle1.id11 && this.checkBox1.CheckState == CheckState.Checked)
                                    {; }
                                    else
                                    {
                                        ve.MoveToLinkPosition(vehicle2.linkid[j], vehicle2.laneid[j], vehicle2.coord[j]);
                                        ve.AttValue["SPEED"] = vehicle2.speed[j];
                                        ve.AttValue["DesSpeed"] = vehicle2.speed[j];//同时修改期望速度
                                    }
                                }
                                if (ve.AttValue["No"] == vehicle1.id11)//输出算法计算本车的结果显示 可用于网联车读取
                                {
                                    textBox1.Text = Convert.ToString(ve.AttValue["LANE"]);
                                    textBox2.Text = Convert.ToString(ve.AttValue["Pos"]);
                                    textBox3.Text = Convert.ToString(ve.AttValue["FollowDist"]);
                                    textBox4.Text = Convert.ToString(ve.AttValue["SPEED"]);
                                    #region 此处可用来发送数据给车辆


                                    #endregion
                                }
                            }
                        }
                        #endregion
                    }
                    #endregion
                    #region 硬件在环选项 写入数据库
                    if (checkBox1.CheckState == CheckState.Checked)//HiLS
                    {
                        foreach (IVehicle veh in simu1.vehicles)
                        {
                            if (veh.AttValue["No"] == vehicle1.id11)
                            {
                                #region 仿真车和真实车数据记录 仿真车记录算法传出内容 真车记录通信数据
                                String SimRun1 = Convert.ToString(veh.AttValue["SimRun"]);
                                String id1 = Convert.ToString(veh.AttValue["No"]);
                                String simsec1 = Convert.ToString(veh.AttValue["SimSec"]);
                                String SPos1 = Convert.ToString(veh.AttValue["Pos"]);
                                String Sspeed = Convert.ToString(veh.AttValue["Speed"]);
                                String Slink = Convert.ToString(veh.AttValue["LANE"].Split('-')[0]);
                                String RPos = Convert.ToString(vehicle1.coord11);
                                String Rspeed = Convert.ToString(vehicle1.speed11);
                                String Rlink = Convert.ToString(vehicle1.linkid11);
                                string cmdstr = "insert into SimorReal(SimRun,ID,SimSec,SPos,Sspeed,Slink,RPos,Rspeed,Rlink) values(" + SimRun1 + "," + id1 + "," + simsec1 + "," + SPos1 + "," + Sspeed + "," + Slink + "," + RPos + "," + Rspeed + "," + Rlink + ")";
                                SqlConnection sc = new SqlConnection(simu1.connstr);
                                SqlCommand cmd = new SqlCommand(cmdstr, sc);//SQL命令器
                                try
                                {
                                    sc.Open();
                                    cmd.ExecuteNonQuery();
                                }
                                catch (Exception ex) { MessageBox.Show(ex.Message); }
                                finally
                                {
                                    sc.Close();
                                    cmd.Dispose();
                                    sc.Dispose();
                                }
                                #endregion

                                veh.MoveToLinkPosition(vehicle1.linkid11, vehicle1.laneid11, vehicle1.coord11);
                                veh.AttValue["SPEED"] = vehicle1.speed11;
                                veh.AttValue["DesSpeed"] = vehicle1.speed11;//同时修改期望速度

                            }
                            else {; }
                        }
                    }

                    #endregion

                }
                else break;
            }//一步内

            if (simu1.itemTimeStep >= simu1.vissim.Simulation.AttValue["SimPeriod"])
            {
                simu1.vissim.Simulation.Stop();
                startFlag = false;

                progressBar1.Value = 0;
            }
        }
        private void button2_Click_1(object sender, EventArgs e)
        {

            try
            {
                #region 路网数据储存vehicle2
                foreach (ILink lk in simu1.net.Links)
                {
                    vehicle2.alllinkid.Add(lk.AttValue["No"]);
                    vehicle2.alllinklen.Add(lk.AttValue["Length2D"]);
                }

                vehicle2.simres = simu1.sim.AttValue["SimRes"];
                vehicle2.simperiod = simu1.sim.AttValue["SimPeriod"];
                #endregion
                simu1.itemTimeStep = 1;

                progressBar1.Value = 0;
                progressBar1.Minimum = 0;
                progressBar1.Maximum = Convert.ToInt32(simu1.sim.AttValue["SimPeriod"] * simu1.sim.AttValue["SimRes"]);//仿真长度为仿真周期*仿真精度 一步为一精度
                startFlag = true;
                //提取DataGridview中的车辆输入 更新com数据  dataGridView1.Rows[i].Cells[j].ToString();
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    foreach (IVehicleInput ip in simu1.net.VehicleInputs)
                    {
                        if (Convert.ToInt32(dataGridView1.Rows[i].Cells[0].Value) == Convert.ToInt32(ip.AttValue["No"]))
                        {
                            if (i % 4 == 0)
                            {
                                foreach (ITimeIntervalVehVolume it in ip.TimeIntVehVols)
                                {
                                    if (Convert.ToString(it.AttValue["TimeInt"]) == "1-1") { it.AttValue["Volume"] = Convert.ToInt32(dataGridView1.Rows[i].Cells[4].Value); }
                                }
                            }
                            if (i % 4 == 1)
                            {
                                foreach (ITimeIntervalVehVolume it in ip.TimeIntVehVols)
                                {
                                    if (Convert.ToString(it.AttValue["TimeInt"]) == "1-2") { it.AttValue["Volume"] = Convert.ToInt32(dataGridView1.Rows[i].Cells[4].Value); }
                                }
                            }
                            if (i % 4 == 2)
                            {
                                foreach (ITimeIntervalVehVolume it in ip.TimeIntVehVols)
                                {
                                    if (Convert.ToString(it.AttValue["TimeInt"]) == "1-3") { it.AttValue["Volume"] = Convert.ToInt32(dataGridView1.Rows[i].Cells[4].Value); }
                                }
                            }
                            if (i % 4 == 3)
                            {
                                foreach (ITimeIntervalVehVolume it in ip.TimeIntVehVols)
                                {
                                    if (Convert.ToString(it.AttValue["TimeInt"]) == "1-4") { it.AttValue["Volume"] = Convert.ToInt32(dataGridView1.Rows[i].Cells[4].Value); }
                                }
                            }
                        }
                    }
                }
                #region 时钟设定
                timer2.Interval = Convert.ToInt16(1000 / (simu1.sim.AttValue["SimRes"] * simu1.sim.AttValue["SimSpeed"]));
                timer2.Enabled = true;
                #endregion

                //
                runsingle();
                if (textBox14.Text == "")
                    return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }
        private void button1_Click_1(object sender, EventArgs e)
        {
            try
            {
                simu1.vissim.Simulation.Stop();
                startFlag = false;
                progressBar1.Value = 0;
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void 仿真展示ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            仿真展示 frm = new 仿真展示();
        }

        private void 参数评价ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            mxpj w3 = new mxpj(); this.Hide();
            w3.ShowDialog();
        }
        private void 退出系统ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //删除原车辆输入表
            string cmdstr = "delete from Vehicleinput";
            SqlConnection sc = new SqlConnection(simu1.connstr);
            SqlCommand cmd = new SqlCommand(cmdstr, sc);//SQL命令器
            try
            {
                sc.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("系统正常退出");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            finally
            {
                sc.Close();
                cmd.Dispose();
                sc.Dispose();
            }
            Application.Exit();
        }
        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                if (startFlag == true)
                {
                    startFlag = !startFlag;
                    runsingle();
                }
                else
                {
                    startFlag = !startFlag;
                    runsingle();
                }
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }

        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                long num = Convert.ToInt32(textBox22.Text);
                simu1.vehicles.RemoveVehicle(num);
                textBox22.Text = "";
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }

        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            { //添加long
                long type = Convert.ToInt32(textBox17.Text);
                double desspeed = Convert.ToDouble(textBox18.Text);
                long link = Convert.ToInt32(textBox19.Text);
                int lane = Convert.ToInt16(textBox20.Text);
                double xcoord = Convert.ToDouble(textBox21.Text);
                simu1.vehicles.AddVehicleAtLinkPosition(type, link, lane, xcoord, desspeed);
                textBox17.Text = "";
                textBox18.Text = "";
                textBox19.Text = "";
                textBox20.Text = "";
                textBox21.Text = "";
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            finally
            {
                textBox17.Text = "";
                textBox18.Text = "";
                textBox19.Text = "";
                textBox20.Text = "";
                textBox21.Text = "";
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox5.Text == "") { textBox5.Text = 1.ToString(); }
                if (textBox6.Text == "") { textBox6.Text = 1.ToString(); }
                if (textBox7.Text == "") { textBox7.Text = 100.ToString(); }
                if (textBox8.Text == "") { textBox8.Text = 1.ToString(); }

                vehicle1.linkid11 = Convert.ToInt32(textBox5.Text);
                vehicle1.laneid11 = Convert.ToInt32(textBox6.Text);
                vehicle1.type11 = Convert.ToInt32(textBox7.Text);
                vehicle1.coord11 = Convert.ToDouble(textBox8.Text);
                connect conn = new connect();
                conn.Show();

            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                simu1.vehicles.AddVehicleAtLinkPosition(vehicle1.type11, vehicle1.linkid11, vehicle1.laneid11, vehicle1.coord11, 20);
                foreach (IVehicle ve in simu1.vehicles)
                {
                    if (ve.AttValue["DesSpeed"] == 20 && ve.AttValue["Pos"] == vehicle1.coord11)
                    {
                        vehicle1.id11 = ve.AttValue["No"];
                        textBox9.Text = Convert.ToString(vehicle1.id11);
                    }
                }
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }

        private void button14_Click(object sender, EventArgs e)
        {
            try
            {
                if (simu1.vissim == null) { MessageBox.Show("还未加载路网"); }
                else if (textBox16.Text == "")
                { MessageBox.Show("请输入仿真周期"); }
                else if (textBox14.Text == "")
                { MessageBox.Show("请输入仿真精度"); }
                else if (textBox15.Text == "")
                { MessageBox.Show("请输入仿真速度"); }
                else
                {
                    simu1.sim.AttValue["SimPeriod"] = Convert.ToInt32(textBox16.Text);
                    simu1.sim.AttValue["SimRes"] = Convert.ToInt32(textBox14.Text);//仿真精度
                    simu1.sim.AttValue["SimSpeed"] = Convert.ToDouble(textBox15.Text);//仿真速度
                    if (textBox13.Text != "") { simu1.sim.AttValue["SimBreakAt"] = Convert.ToInt32(textBox13.Text); }//中断时刻
                    else {; }

                }
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }


        }

        private void button9_Click_1(object sender, EventArgs e)
        {
            try
            {
                long type = 100;
                double desspeed = 20;
                long link = 1;
                int lane = 1;
                double xcoord = 0.1;
                simu1.vehicles.AddVehicleAtLinkPosition(type, link, lane, xcoord, desspeed);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }
        private void button12_Click(object sender, EventArgs e)
        {
            try
            {
                long type = 100;
                double desspeed = 20;
                long link = 2;
                int lane = 1;
                double xcoord = 0.1;
                simu1.vehicles.AddVehicleAtLinkPosition(type, link, lane, xcoord, desspeed);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }
        private void button11_Click(object sender, EventArgs e)
        {
            try
            {
                long type = 100;
                double desspeed = 20;
                long link = 4;
                int lane = 1;
                double xcoord = 0.1;
                simu1.vehicles.AddVehicleAtLinkPosition(type, link, lane, xcoord, desspeed);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void button15_Click(object sender, EventArgs e)
        {
            simu1.vissim.Exit();
            fileopen = false;
            //删除原车辆输入表
            string cmdstr = "delete from Vehicleinput";
            SqlConnection sc = new SqlConnection(simu1.connstr);
            SqlCommand cmd = new SqlCommand(cmdstr, sc);//SQL命令器
            try
            {
                sc.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            finally
            {
                sc.Close();
                cmd.Dispose();
                sc.Dispose();
            }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button13_Click(object sender, EventArgs e)
        {
            try
            {
                vehicle1.id11 = Convert.ToInt64(textBox9.Text);
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }


        private void button17_Click(object sender, EventArgs e)
        {
            try
            {
                long type = 100;
                double desspeed = 20;
                long link = 3;
                int lane = 1;
                double xcoord = 0.1;
                simu1.vehicles.AddVehicleAtLinkPosition(type, link, lane, xcoord, desspeed);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            startFlag1 = true;
            timer2.Stop();
            runsingle();

        }
    }
}
