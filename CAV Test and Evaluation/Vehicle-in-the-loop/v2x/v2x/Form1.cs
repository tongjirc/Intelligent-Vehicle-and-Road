using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using VISSIMLIB;

namespace v2x
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void 仿真展示ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (checkBox1.CheckState == CheckState.Checked)
            {
                仿真展示 w2 = new 仿真展示();
                this.Hide();
                w2.ShowDialog();
            }
            else if (checkBox1.CheckState == CheckState.Unchecked)
                MessageBox.Show("请仔细阅读使用须知,并勾选我同意");
        }
        private void 基础设置ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 w1 = new Form1();
        }
        private void 参数评价ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (checkBox1.CheckState == CheckState.Checked)
            {
                mxpj w3 = new mxpj();
            w3.ShowDialog();
            this.Hide();
            }
            else if (checkBox1.CheckState == CheckState.Unchecked)
                MessageBox.Show("请仔细阅读使用须知,并勾选我同意");
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
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkBox1.CheckState == CheckState.Checked)
                {
                    //删除原车辆信息表内容
                    string cmdstr = "delete from VEHICLE";
                    //删除原车辆输入表
                    string cmdstr1 = "delete from Vehicleinput";
                    string cmdstr2 = "delete from SimorReal";
                    SqlConnection sc = new SqlConnection(simu1.connstr);
                    SqlCommand cmd1 = new SqlCommand(cmdstr1, sc);//SQL命令器
                    SqlCommand cmd = new SqlCommand(cmdstr, sc);//SQL命令器
                    SqlCommand cmd2 = new SqlCommand(cmdstr2, sc);//SQL命令器
                    try
                    {
                        sc.Open();
                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                    }
                    catch (Exception ex) { MessageBox.Show(ex.Message); }
                    finally
                    {
                        sc.Close();
                        cmd1.Dispose();
                        cmd.Dispose();
                        cmd2.Dispose();
                        sc.Dispose();
                    }
                    //
                    仿真展示 w2 = new 仿真展示();
                    this.Hide();
                    w2.ShowDialog();
                }
                else if (checkBox1.CheckState == CheckState.Unchecked)
                    MessageBox.Show("请仔细阅读使用须知,并勾选我同意");
            }
            catch(Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
