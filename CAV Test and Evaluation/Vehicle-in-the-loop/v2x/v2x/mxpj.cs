using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;
using draw;
using rsv;
using rsp;

namespace v2x
{
    public partial class mxpj : Form
    {
        public mxpj()
        {
            InitializeComponent();
        }
        private void 仿真展示ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            仿真展示 w2 = new 仿真展示(); this.Hide();
            w2.ShowDialog();
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
            finally { sc.Close(); }
            Application.Exit();
        }

        private void 基础设置ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 w1 = new Form1();this.Hide();
            w1.ShowDialog();     
        }
        private void button2_Click(object sender, EventArgs e)
        {
            checkBox1.Checked = false;
            checkBox2.Checked = false;
            checkBox3.Checked = false;
            checkBox4.Checked = false;
            checkBox5.Checked = false;
            checkBox6.Checked = false;
            checkBox7.Checked = false;
            checkBox8.Checked = false;
            checkBox9.Checked = false;
            checkBox10.Checked = false;
            checkBox12.Checked = false;
            checkBox13.Checked = false;
        }
        private void 仿真展示ToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            仿真展示 w2 = new 仿真展示();
            this.Hide();
            w2.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = simu1.connstr;
            DataTable dt = new DataTable();
            BindingSource bingdingsourse1 = new BindingSource();
            DataRow dr = dt.NewRow();
            try
            {
                conn.Open();
                if (checkBox1.Checked == true)
                {
                    SqlCommand cmd_maxv = new SqlCommand("maxv", conn);
                    cmd_maxv.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd_maxv);
                    da.Fill(dt);
                    bingdingsourse1.DataSource = dt;
                    dataGridView1.DataSource = bingdingsourse1;
                }
                else
                {
                    dt = null;
                }
                if (checkBox3.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_minv = new SqlCommand("minv", conn);
                        cmd_minv.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_minv.ExecuteReader();
                        dt.Columns.Add(" ");
                        dt.Columns.Add("仿真编号1");
                        dt.Columns.Add("最小速度");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号1"] = (reader["仿真编号"].ToString());
                                dt.Rows[i]["最小速度"] = (reader["最小速度"].ToString());
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt3 = new DataTable();
                        SqlCommand cmd_minv = new SqlCommand("minv", conn);
                        cmd_minv.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_minv);
                        da.Fill(dt3);
                        dt = dt3;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox3.Checked == false)
                {
                    dt = null;
                }
                if (checkBox2.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_rangev = new SqlCommand("rangev", conn);
                        cmd_rangev.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_rangev.ExecuteReader();
                        dt.Columns.Add("  ");
                        dt.Columns.Add("仿真编号2");
                        dt.Columns.Add("仿真时间2");
                        dt.Columns.Add("速度极差");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count) - 1)
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号2"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["仿真时间2"] = reader["仿真时间"].ToString();
                                dt.Rows[i]["速度极差"] = reader["速度极差"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt2 = new DataTable();
                        SqlCommand cmd_rangev = new SqlCommand("rangev", conn);
                        cmd_rangev.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_rangev);
                        da.Fill(dt2);
                        dt = dt2;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false)
                {
                    dt = null;
                }
                if (checkBox4.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_avgv = new SqlCommand("avgv", conn);
                        cmd_avgv.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_avgv.ExecuteReader();
                        dt.Columns.Add("   ");
                        dt.Columns.Add("仿真编号3");
                        dt.Columns.Add("仿真时间3");
                        dt.Columns.Add("空间平均速度");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号3"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["仿真时间3"] = reader["仿真时间"].ToString();
                                dt.Rows[i]["空间平均速度"] = reader["空间平均速度"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt4 = new DataTable();
                        SqlCommand cmd_avgv = new SqlCommand("avgv", conn);
                        cmd_avgv.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_avgv);
                        da.Fill(dt4);
                        dt = dt4;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false)
                {
                    dt = null;
                }
                if (checkBox5.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_stdevv = new SqlCommand("stdevv", conn);
                        cmd_stdevv.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_stdevv.ExecuteReader();
                        dt.Columns.Add("    ");
                        dt.Columns.Add("仿真编号4");
                        dt.Columns.Add("车辆编号4");
                        dt.Columns.Add("车速标准差");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号4"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["车辆编号4"] = reader["车辆编号"].ToString();
                                dt.Rows[i]["车速标准差"] = reader["车速标准差"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt5 = new DataTable();
                        SqlCommand cmd_stdevv = new SqlCommand("stdevv", conn);
                        cmd_stdevv.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_stdevv);
                        da.Fill(dt5);
                        dt = dt5;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false)
                {
                    dt = null;
                }
                if (checkBox7.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_maxa = new SqlCommand("maxa", conn);
                        cmd_maxa.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_maxa.ExecuteReader();
                        dt.Columns.Add("     ");
                        dt.Columns.Add("仿真编号5");
                        dt.Columns.Add("最大加速度5");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号5"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["最大加速度5"] = reader["最大加速度"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt7 = new DataTable();
                        SqlCommand cmd_maxa = new SqlCommand("maxa", conn);
                        cmd_maxa.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_maxa);
                        da.Fill(dt7);
                        dt = dt7;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false)
                {
                    dt = null;
                }
                if (checkBox8.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_mina = new SqlCommand("mina", conn);
                        cmd_mina.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_mina.ExecuteReader();
                        dt.Columns.Add("      ");
                        dt.Columns.Add("仿真编号6");
                        dt.Columns.Add("最小加速度");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号6"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["最小加速度"] = reader["最小加速度"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt8 = new DataTable();
                        SqlCommand cmd_mina = new SqlCommand("mina", conn);
                        cmd_mina.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_mina);
                        da.Fill(dt8);
                        dt = dt8;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false)
                {
                    dt = null;
                }
                if (checkBox9.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_delayt = new SqlCommand("delayt", conn);
                        cmd_delayt.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_delayt.ExecuteReader();
                        dt.Columns.Add("       ");
                        dt.Columns.Add("仿真编号7");
                        dt.Columns.Add("车辆编号7");
                        dt.Columns.Add("延误时间");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号7"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["车辆编号7"] = reader["车辆编号"].ToString();
                                dt.Rows[i]["延误时间"] = reader["延误时间"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt9 = new DataTable();
                        SqlCommand cmd_delayt = new SqlCommand("delayt", conn);
                        cmd_delayt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_delayt);
                        da.Fill(dt9);
                        dt = dt9;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false & checkBox9.Checked == false)
                {
                    dt = null;
                }
                if (checkBox13.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_qcount = new SqlCommand("qcount", conn);
                        cmd_qcount.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_qcount.ExecuteReader();
                        dt.Columns.Add("         ");
                        dt.Columns.Add("仿真编号8");
                        dt.Columns.Add("仿真时间8");
                        dt.Columns.Add("排队数");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号8"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["仿真时间8"] = reader["仿真时间"].ToString();
                                dt.Rows[i]["排队数"] = reader["排队数"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt10 = new DataTable();
                        SqlCommand cmd_qcount = new SqlCommand("qcount", conn);
                        cmd_qcount.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_qcount);
                        da.Fill(dt10);
                        dt = dt10;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false & checkBox9.Checked == false & checkBox13.Checked == false)
                {
                    dt = null;
                }
                if (checkBox12.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_nstop = new SqlCommand("nstop", conn);
                        cmd_nstop.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_nstop.ExecuteReader();
                        dt.Columns.Add("           ");
                        dt.Columns.Add("仿真编号9");
                        dt.Columns.Add("车辆编号9");
                        dt.Columns.Add("停车次数");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (i >= (dt.Rows.Count))
                            {
                                dt.Rows.Add(dr.ItemArray);
                            }
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真编号9"] = reader["仿真编号"].ToString();
                                dt.Rows[i]["车辆编号9"] = reader["车辆编号"].ToString();
                                dt.Rows[i]["停车次数"] = reader["停车次数"].ToString();
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt11 = new DataTable();
                        SqlCommand cmd_nstop = new SqlCommand("nstop", conn);
                        cmd_nstop.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_nstop);
                        da.Fill(dt11);
                        dt = dt11;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false & checkBox9.Checked == false & checkBox13.Checked == false & checkBox12.Checked == false)
                {
                    dt = null;
                }
                if (checkBox6.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_sz = new SqlCommand("sz", conn);
                        cmd_sz.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_sz.ExecuteReader();
                        dt.Columns.Add(". ");
                        dt.Columns.Add("仿真时间10");
                        dt.Columns.Add("速度执行度");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真时间10"] = (reader["仿真时间"].ToString());
                                dt.Rows[i]["速度执行度"] = (reader["速度执行度"].ToString());
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt12 = new DataTable();
                        SqlCommand cmd_sz = new SqlCommand("sz", conn);
                        cmd_sz.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_sz);
                        da.Fill(dt12);
                        dt = dt12;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false & checkBox9.Checked == false & checkBox13.Checked == false & checkBox12.Checked == false & checkBox6.Checked == false)
                {
                    dt = null;
                }
                if (checkBox10.Checked == true)
                {
                    if (dt != null)
                    {
                        SqlCommand cmd_zc = new SqlCommand("zc", conn);
                        cmd_zc.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd_zc.ExecuteReader();
                        dt.Columns.Add(" . ");
                        dt.Columns.Add("仿真时间11");
                        dt.Columns.Add("位置差值");
                        for (int i = 0; i < 1000; i++)
                        {
                            if (reader.Read() == false) break;
                            else
                            {
                                dt.Rows[i]["仿真时间11"] = (reader["仿真时间"].ToString());
                                dt.Rows[i]["位置差值"] = (reader["位置差值"].ToString());
                            }
                        }
                        reader.Close();
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                    else
                    {
                        DataTable dt13 = new DataTable();
                        SqlCommand cmd_zc = new SqlCommand("zc", conn);
                        cmd_zc.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd_zc);
                        da.Fill(dt13);
                        dt = dt13;
                        bingdingsourse1.DataSource = dt;
                        dataGridView1.DataSource = bingdingsourse1;
                    }
                }
                if (checkBox1.Checked == false & checkBox2.Checked == false & checkBox3.Checked == false & checkBox4.Checked == false & checkBox5.Checked == false & checkBox7.Checked == false & checkBox8.Checked == false & checkBox9.Checked == false & checkBox13.Checked == false & checkBox12.Checked == false & checkBox6.Checked == false & checkBox10.Checked == false)
                {
                    dt = null;
                }
            }
            finally
            {
                conn.Close();
            }
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "Execl files (*.xls)|*.xls";
            saveFileDialog.FilterIndex = 0;
            saveFileDialog.RestoreDirectory = true;
            saveFileDialog.CreatePrompt = true;
            saveFileDialog.Title = "Export Excel File";
            saveFileDialog.ShowDialog();
            if (saveFileDialog.FileName == "")
                return;
            Stream myStream;
            myStream = saveFileDialog.OpenFile();
            StreamWriter sw = new StreamWriter(myStream, System.Text.Encoding.GetEncoding(-0));

            string str = "";
            try
            {
                for (int i = 0; i < dataGridView1.ColumnCount; i++)
                {
                    if (i > 0)
                    {
                        str += "\t";
                    }
                    str += dataGridView1.Columns[i].HeaderText;
                }
                sw.WriteLine(str);
                for (int j = 0; j < dataGridView1.Rows.Count; j++)
                {
                    string tempStr = "";
                    for (int k = 0; k < dataGridView1.Columns.Count; k++)
                    {
                        if (k > 0)
                        {
                            tempStr += "\t";
                        }
                        tempStr += dataGridView1.Rows[j].Cells[k].Value.ToString();
                    }
                    sw.WriteLine(tempStr);
                }
                sw.Close();
                myStream.Close();
            }

            catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString());  
            }
            finally
            {
                sw.Close();
                myStream.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = simu1.connstr;
                conn.Open();
                SqlCommand cmd_avgv = new SqlCommand("avgv", conn);
                cmd_avgv.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd_avgv.ExecuteReader();
                int m = 0;
                for (int i = 0; i < 1000000; i++)
                {
                    if (reader.Read() == false) break;
                    else
                    {
                        int no1 = Convert.ToInt32(reader["仿真时间"]);
                        int no2 = Convert.ToInt32(reader["空间平均速度"]);
                    }
                    m++;
                }
                reader.Close();
                double[] n1 = new double[m];
                double[] n2 = new double[m];
                SqlDataReader reader2 = cmd_avgv.ExecuteReader();
                for (int i = 0; i < m; i++)
                {
                    reader2.Read();
                    int no1 = Convert.ToInt32(reader2["仿真时间"]);
                    int no2 = Convert.ToInt32(reader2["空间平均速度"]);
                    n1[i] = no1;
                    n2[i] = no2;
                }
                reader2.Close();
                conn.Close();
                draw.Class1 ta = new draw.Class1();
                MWNumericArray a = new MWNumericArray(1, m, n1);//int row,int column,double[] real
                MWNumericArray b = new MWNumericArray(1, m, n2);
                ta.draw(a, b);
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = simu1.connstr;
            conn.Open();
            SqlCommand cmd_rsv = new SqlCommand("rsv", conn);
            cmd_rsv.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd_rsv.ExecuteReader();
            int m = 0;
            for (int i = 0; i < 1000000; i++)
            {
                if (reader.Read() == false) break;
                else
                {
                    int no1 = Convert.ToInt32(reader["仿真时间"]);
                    int no2 = Convert.ToInt32(reader["理论速度"]);
                    int no3 = Convert.ToInt32(reader["实际速度"]);
                }
                m++;
            }
            reader.Close();
            double[] n1 = new double[m];
            double[] n2 = new double[m];
            double[] n3 = new double[m];
            SqlDataReader reader2 = cmd_rsv.ExecuteReader();
            for (int i = 0; i < m; i++)
            {
                reader2.Read();
                int no1 = Convert.ToInt32(reader2["仿真时间"]);
                int no2 = Convert.ToInt32(reader2["理论速度"]);
                int no3 = Convert.ToInt32(reader2["实际速度"]);
                n1[i] = no1;
                n2[i] = no2;
                n3[i] = no3;
            }
            reader2.Close();
            conn.Close();
            rsv.Class1 ta = new rsv.Class1();
            MWNumericArray a = new MWNumericArray(1, m, n1);//int row,int column,double[] real
            MWNumericArray b = new MWNumericArray(1, m, n2);
            MWNumericArray c = new MWNumericArray(1, m, n3);
            ta.rsv(a, b, c);
        }
        private void button5_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = simu1.connstr;
            conn.Open();
            SqlCommand cmd_rsp = new SqlCommand("rsp", conn);
            cmd_rsp.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd_rsp.ExecuteReader();
            int m = 0;
            for (int i = 0; i < 1000000; i++)
            {
                if (reader.Read() == false) break;
                else
                {
                    int no1 = Convert.ToInt32(reader["仿真时间"]);
                    int no2 = Convert.ToInt32(reader["理论位置"]);
                    int no3 = Convert.ToInt32(reader["实际位置"]);
                }
                m++;
            }
            reader.Close();
            double[] n1 = new double[m];
            double[] n2 = new double[m];
            double[] n3 = new double[m];
            SqlDataReader reader2 = cmd_rsp.ExecuteReader();
            for (int i = 0; i < m; i++)
            {
                reader2.Read();
                int no1 = Convert.ToInt32(reader2["仿真时间"]);
                int no2 = Convert.ToInt32(reader2["理论位置"]);
                int no3 = Convert.ToInt32(reader2["实际位置"]);
                n1[i] = no1;
                n2[i] = no2;
                n3[i] = no3;
            }
            reader2.Close();
            conn.Close();
            rsp.Class1 ta = new rsp.Class1();
            MWNumericArray a = new MWNumericArray(1, m, n1);//int row,int column,double[] real
            MWNumericArray b = new MWNumericArray(1, m, n2);
            MWNumericArray c = new MWNumericArray(1, m, n3);
            ta.rsp(a, b, c);
        }
    }
}
