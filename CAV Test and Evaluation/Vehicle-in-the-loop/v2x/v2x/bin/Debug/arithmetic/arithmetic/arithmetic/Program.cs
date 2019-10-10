using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace arithmetic
{
    public class Class1
    {
        //定义全局变量（算法函数中无需全部使用）
        public static List<Int32> veh_ID;    //车辆编号
        public static List<double> des_SPEED;     //期望速度
        public static List<double> veh_LENGTH;     //车辆长度
        public static List<double> veh_SPEED;     //当前车速
        public static List<double> veh_WEIGHT;     //车辆总重
        public static List<double> veh_LINKCOORD;     //车辆位置（距离路段起点距离）
        public static List<double> veh_ACCELERATION;     //车辆加速度
        public static List<double> veh_HEIGHT;     //车辆高度
        public static List<double> veh_DISTANCE;     //跟车距离
        public static List<Int32> all_LINK;     //所有路段编号
        public static List<double> all_LINKLENGTH;     //所有路段长度
        public static Int32 SIMRES;     //仿真精度
        public static Int32 SIMPERIOD;     //仿真周期
        public static List<string> vehicle_TYPE;     //车辆类型
        public static List<Int32> veh_LANE;     //车辆所在车道编号
        public static List<string> veh_LANECHANGE;     //车辆变道
        public static List<Int32> veh_LINK;     //车辆所在路段编号
        public static List<string> next_LINK;     //车辆经过下一个路段编号
        public static List<double>  TIME;     //仿真时间
        //算法函数
        public List<double> arithmetic_veh_speed()     //改变期望速度
        {
            #region CACC跟驰模型
            int m = veh_ID.Count;
            double[] e = new double[m];
            for (int i = 0; i < m; i++)
            {
                e[i] = veh_DISTANCE[i] - 0.6 * veh_SPEED[i] / 3.6;
            }
            int[] ID = new int[m];
            for (int i = 0; i < m; i++)
            {
                if (veh_DISTANCE[i] == 250)
                    ID[i] = 0;
                else
                {
                    int n = 0;
                    for (int j = 0; j < m; j++)
                    {
                        if (veh_LANE[i] == veh_LANE[j] && veh_LINK[i] == veh_LINK[j])
                        {
                            if (veh_DISTANCE[i] == veh_LINKCOORD[j] - veh_LINKCOORD[i] - veh_LENGTH[j])
                            {
                                ID[i] = j;
                                n = n + 1;
                                break;
                            }
                        }
                    }
                    if (n == 0)
                        ID[i] = 0;
                }
            }
            double[] des_acceleraion = new double[m];
            for (int i = 0; i < m; i++)
            {
                if (ID[i] == 0)
                {
                    des_acceleraion[i] = 1;
                }
                else
                {
                    des_acceleraion[i] = 1.1 * veh_ACCELERATION[ID[i]] + 0.23 * e[i] - 0.07 * (veh_SPEED[i] / 3.6 - veh_SPEED[ID[i]] / 3.6);
                }
            }
            for (int i = 0; i < m; i++)
            {
                veh_SPEED[i] = 3.6 * (veh_SPEED[i] / 3.6 + des_acceleraion[i] / SIMRES);
                if (veh_SPEED[i] > 20)
                    veh_SPEED[i] = 20;
            }
            #endregion
            #region 匀速行驶
            //int m = veh_ID.Count;
            //for (int i = 0; i < m; i++)
            //{
            //    veh_SPEED[i] = 20;
            //}
            #endregion
            return veh_SPEED;
           
        }

        public List<double> arithmetic_veh_linkcoord()     //改变车辆在路段内的位置
        {
            //int num = veh_ID.Count;
            //for (int i = 0; i < num; i++)
            //{
            //    veh_LINKCOORD[i] = veh_LINKCOORD[i] + des_SPEED[i] / SIMRES;
            //}
            return veh_LINKCOORD;
        }

        public List<Int32> arithmetic_veh_link()     //改变车辆所在路段
        {
            return veh_LINK;
        }

        public List<Int32> arithmetic_veh_lane()     //改变车辆所在车道
        {
            return veh_LANE;
        }
    }
}
