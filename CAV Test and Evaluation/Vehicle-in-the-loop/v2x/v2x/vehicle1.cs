using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VISSIMLIB;

//本车车辆信息类
namespace v2x
{
    public class vehicle1
    {
        //现实中数据在路网中
        static public long id11 = 1;
        static public long type11 = 100;
        static public double speed11 = 0;
        static public double angle11 = 0.0; //无法用到
        static public int laneid11 = 1;
        static public long linkid11 = 1;
        static public double coord11 = 0.0;
        static public double acceleration = 0;
        //路网中数据
        static public double frontx;
        static public double fronty;
        static public double rearx;
        static public double reary;
        static public double x_s;
        static public double y_s;
        static public double v_s;
        static public double a_s;
        static public double angle_s;

        //现实中目标数据
        static public double x_m;
        static public double y_m;
        static public double vx_m;
        static public double vy_m;
        static public double yaw_m;
        static public double yawrate_m = -99;
        static public double ax_m;
        static public double ay_m;
        static private double theta = 2.1166326274231118; //矫正角度 VISSIM结算出 
        static private double x0 = -1.372;//VISSIM原点在世界坐标系中的位置
        static private double y0 = 0.418;
        static public string sendmsg;
        /// <summary>
        /// calc vehicle1 goal publish 
        /// </summary>
        static public void calc()
        {
            x_s = frontx / 2 + rearx / 2;
            y_s = fronty / 2 + reary / 2;
            x_m = (x_s * Math.Cos(theta) - y_s * Math.Sin(theta)) / 10 + x0;
            y_m = (x_s * Math.Sin(theta) + y_s * Math.Cos(theta)) / 10 + y0;
            angle_s = Math.Atan2(fronty - reary, frontx - rearx);
            if (yawrate_m == -99) yawrate_m = 0;
            else yawrate_m = (angle_s + theta - yaw_m) * vehicle2.simres;
            yaw_m = angle_s + theta;
            vx_m = (v_s * Math.Cos(yaw_m)) / 10;
            vy_m = (v_s * Math.Sin(yaw_m)) / 10;
            ax_m = (a_s * Math.Cos(yaw_m)) / 10;
            ay_m = (a_s * Math.Sin(yaw_m)) / 10;
            sendmsg = x_m.ToString() + '/' + y_m.ToString() + '/' + yaw_m.ToString() + '/' + vx_m.ToString() + '/' + vy_m.ToString() + '/' + yawrate_m.ToString() + '/' + ax_m.ToString() + '/' + ay_m.ToString() + '/' + 0.ToString() + '/' + vehicle1.id11.ToString();
        }
    }
}
