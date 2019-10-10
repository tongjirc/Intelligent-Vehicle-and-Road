using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Threading;
using System.Net.Sockets;
using GMap.NET;
using GMap.NET.MapProviders;
using GMap.NET.WindowsForms;
using GMap.NET.WindowsForms.Markers;
using GMap.NET.WindowsForms.ToolTips;
using System.Threading.Tasks;
using Ros_CSharp;
using XmlRpc_Wrapper;
using Int32 = Messages.std_msgs.Int32;
using String = Messages.std_msgs.String;
using m = Messages.std_msgs;
using gm = Messages.geometry_msgs;
using nm = Messages.nav_msgs;
using sm = Messages.sensor_msgs;
using jp = Messages.trajectory_msgs.JointTrajectoryPoint;
using du = Messages.std_msgs.Duration;
using Messages.trajectory_msgs;

//216 id 419  131 id 415
namespace v2x
{
    public partial class connect : Form
    {
        public connect()
        {
            InitializeComponent();
            CheckForIllegalCrossThreadCalls = false;//线程通信
        }

        int fx = 3; //默认右转

        static jp jp_send = new jp(); //路侧发送
        static jp jp_get = new jp(); //路侧接收
        static du du_send = new du();
        static NodeHandle node;

        TcpClient tcp = new TcpClient();//获取车辆信息client
        LogTool lg1 = new LogTool();    //日志类
        vehicle v1 = new vehicle();
        readmap read1 = new readmap();
        jp sendMsg = new jp();
        readmap r1 = new readmap();

        #region ROS+地图
        public void initRos()
        {
            ROS.Init(new string[0], "road");
            node = new NodeHandle();
        }
        /// <summary>
        /// subscriber callback
        /// </summary>
        /// <param name="msg"></param>
        public void subCallback(jp msg)
        {

            writelisten(msg);

        }
        /// <summary>
        /// publish goal
        /// </summary>
        static void publish()
        {

            Publisher<m.String> Talker = node.advertise<m.String>("goal", 10);
            while (true)//不可用ROS.ok
            {
                vehicle1.calc();
                String strSend = new String(vehicle1.sendmsg);
                Talker.publish(strSend);
                Thread.Sleep(100);
            }
        }

        /// <summary>
        /// subscribe status
        /// </summary>
        void subscribe()
        {
            Subscriber<jp> Listener = node.subscribe<jp>("status", 10, subCallback);
        }
        /// <summary>
        /// write the jp_get
        /// </summary>
        void writelisten(jp recMsg)
        {
            lock (recMsg)
            {
                try
                {
                    //position:Xx,Xy,theta
                    //velocities:Vx,Vy,W
                    //accelerations:Ax,Ay
                    //efforts:ID

                    v1.ID = Convert.ToInt32(recMsg.effort[0].ToString());
                    v1.status1.position.lati = Convert.ToDouble(recMsg.positions[0].ToString());//传入数据用于匹配和计算距离
                    v1.status1.position.lonti = Convert.ToDouble(recMsg.positions[1]);
                    v1.status1.speed = Math.Sqrt(Math.Pow(Convert.ToDouble(recMsg.velocities[0].ToString()), 2) + Math.Pow(Convert.ToDouble(recMsg.velocities[1].ToString()), 2))*10; //放大十倍
                    v1.status1.angle = Convert.ToDouble(recMsg.positions[2].ToString())*180/Math.PI+ 180; //转换 [-180,+180] [0,360]
                    v1.status1.acceleration = Math.Sqrt(Math.Pow(Convert.ToDouble(recMsg.accelerations[0].ToString()), 2) + Math.Pow(Convert.ToDouble(recMsg.accelerations[1].ToString()), 2))*10; //放大10倍
                    r1.getMap();
                    v1.mapmatch();
                    v1.caly();//计算位置

                    #region 寻找目的地及connector
                    if (v1.path1.lanestart.ID == 1)
                    {
                        if (fx == 1)//左转
                        {
                            v1.path1.laneend.ID = 8;
                            v1.path1.findend();
                        }
                        if (fx == 2)//直行
                        {
                            v1.path1.laneend.ID = 7;
                            v1.path1.findend();
                        }
                        if (fx == 3)//右转
                        {
                            v1.path1.laneend.ID = 6;
                            v1.path1.findend();
                        }
                    }
                    if (v1.path1.lanestart.ID == 2)
                    {
                        if (fx == 1)//左转
                        {
                            v1.path1.laneend.ID = 5;
                            v1.path1.findend();
                        }
                        if (fx == 2)//直行
                        {
                            v1.path1.laneend.ID = 8;
                            v1.path1.findend();
                        }
                        if (fx == 3)//右转
                        {
                            v1.path1.laneend.ID = 7;
                            v1.path1.findend();
                        }
                    }
                    if (v1.path1.lanestart.ID == 3)
                    {
                        if (fx == 1)//左转
                        {
                            v1.path1.laneend.ID = 6;
                            v1.path1.findend();
                        }
                        if (fx == 2)//直行
                        {
                            v1.path1.laneend.ID = 5;
                            v1.path1.findend();
                        }
                        if (fx == 3)//右转
                        {
                            v1.path1.laneend.ID = 8;
                            v1.path1.findend();
                        }
                    }
                    if (v1.path1.lanestart.ID == 4)
                    {
                        if (fx == 1)//左转
                        {
                            v1.path1.laneend.ID = 7;
                            v1.path1.findend();
                        }
                        if (fx == 2)//直行
                        {
                            v1.path1.laneend.ID = 6;
                            v1.path1.findend();
                        }
                        if (fx == 3)//右转
                        {
                            v1.path1.laneend.ID = 5;
                            v1.path1.findend();
                        }
                    }

                    #endregion //描述拓扑关系

                    v1.path1.getcon();

                    #region 读出数据
                    if (v1.shibie == 0)
                    {
                        textBox3.Text = Convert.ToString(v1.status1.conid);
                        vehicle1.linkid11 = v1.status1.conid;
                    }
                    else
                    {
                        textBox3.Text = Convert.ToString(v1.status1.linkid);
                        vehicle1.linkid11 = v1.status1.linkid;
                    }
                    textBox1.Text = Convert.ToString(v1.status1.position.lati);
                    textBox2.Text = Convert.ToString(v1.status1.position.lonti);
                    textBox4.Text = Convert.ToString(v1.status1.angle);
                    textBox5.Text = Convert.ToString(v1.status1.speed);
                    textBox6.Text = Convert.ToString(v1.status1.y);      
                    textBox7.Text = Convert.ToString(v1.shibie);
                    textBox8.Text = Convert.ToString(v1.status1.acceleration);
                    vehicle1.coord11 = v1.status1.y;
                    vehicle1.speed11 = v1.status1.speed;
                    vehicle1.acceleration = v1.status1.acceleration;
                    vehicle1.angle11 = v1.status1.angle;

                    #endregion
                }
                catch (Exception ex) { MessageBox.Show(ex.ToString()); }



            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                initRos();
                Thread Recievemessage;//Listen线程
                Thread Sendmessage;//Publish线程

                Recievemessage = new Thread(new ThreadStart(subscribe));
                Recievemessage.IsBackground = true;//使得程序界面关闭时线程也可以关闭
                Recievemessage.Start();
                Sendmessage = new Thread(new ThreadStart(publish));
                Sendmessage.IsBackground = true;
                Sendmessage.Start();

                read1.getMap();
                //listenr();//writelisten
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }

        #endregion

        #region 获取车辆信息

        delegate void signal_TextBoxCallback(double m);


        #endregion
        private void connect_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            fx = 1;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            fx = 2;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            fx = 3;
        }
        protected override void OnClosing(System.ComponentModel.CancelEventArgs e)
        {
            ROS.shutdown();
            ROS.waitForShutdown();
            base.OnClosing(e);
        }

        
    }
}
