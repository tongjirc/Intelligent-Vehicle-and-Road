using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VISSIMLIB;
using arithmetic;
//路网中信息用于TCP/IP通信
namespace v2x
{
    public class vehicle2
    {
        
        static public List<Int32> ID=new List<Int32>();//车辆No·
        static public List<double> des_speed=new List<double>();//车辆期望速度·
        static public List<double> length = new List<double>();//车辆长度·
        static public List<double> speed = new List<double>();//车辆速度·
        static public List<double> weight = new List<double>();//车辆重量·
        static public List<double> coord = new List<double>();//车辆在路段中的位置·
        static public List<double> acce = new List<double>();//车辆加速度·
        static public List<double> height = new List<double>();//车辆高度·
        static public List<double> distance = new List<double>();//车辆跟车距离m·
        static public List<string> type = new List<string>();//车辆种类·
        static public List<Int32> laneid = new List<Int32>();//所处车道id·
        static public List<string> lanechange = new List<string>();//变道1左0无-1右·
        static public List<Int32> linkid = new List<Int32>();//所处路段id·
        static public List<Int32> alllinkid = new List<Int32>();//所有linkID·
        static public List<double> alllinklen = new List<double>();//所有link长度·
        static public Int32 simres = new Int32();//仿真精度 一仿真秒运行次数·
        static public Int32 simperiod = new Int32();//仿真周期·
        static public List<string> nextlink = new List<string>();//下一个路段名 未识别的时候用00000占位
        static public List<double> simsec = new List<double>();//第几仿真秒 时间
        //注意每个变量的类型
        static public void clear()
        {
                            vehicle2.ID.Clear();
                            vehicle2.des_speed.Clear();
                            vehicle2.length.Clear();
                            vehicle2.speed.Clear();
                            vehicle2.weight.Clear();
                            vehicle2.coord.Clear();
                            vehicle2.acce.Clear();
                            vehicle2.height.Clear();
                            vehicle2.distance.Clear();
                            vehicle2.type.Clear();
                            vehicle2.lanechange.Clear();
                            vehicle2.laneid.Clear();
                            vehicle2.linkid.Clear();
                            vehicle2.nextlink.Clear();
                            vehicle2.simsec.Clear();
        }
        static public void communi(IVehicle vehicle)
        {
            vehicle2.ID.Add(vehicle.AttValue["No"]);//int32
            vehicle2.des_speed.Add(vehicle.AttValue["DesSpeed"]);
            vehicle2.length.Add(vehicle.AttValue["Length"]);
            vehicle2.speed.Add(vehicle.AttValue["Speed"]);
            vehicle2.weight.Add(vehicle.AttValue["Weight"]);
            vehicle2.coord.Add(vehicle.AttValue["Pos"]);
            vehicle2.acce.Add(vehicle.AttValue["Acceleration"]);
            vehicle2.height.Add(vehicle.AttValue["Height"]);
            vehicle2.distance.Add(vehicle.AttValue["FollowDist"]);
            vehicle2.type.Add(vehicle.AttValue["VehType"]);
            vehicle2.lanechange.Add(vehicle.AttValue["LnChg"]);
            vehicle2.laneid.Add(Convert.ToInt32(vehicle.AttValue["LANE"].Split('-')[1]));
            vehicle2.linkid.Add(Convert.ToInt32(vehicle.AttValue["LANE"].Split('-')[0]));
            if (vehicle.AttValue["NextLink"] == null)
                vehicle2.nextlink.Add("00000");//若下一个路口为空值 则利用00000占位
            else
                vehicle2.nextlink.Add(vehicle.AttValue["NEXTLINK"]);
            vehicle2.simsec.Add(vehicle.AttValue["SimSec"]);
        }
        static public void sf()
        {
            Class1.veh_ID = vehicle2.ID;
            Class1.vehicle_TYPE = vehicle2.type;
            Class1.des_SPEED = vehicle2.des_speed;
            Class1.veh_LANE = vehicle2.laneid;
            Class1.veh_LANECHANGE = vehicle2.lanechange;
            Class1.veh_LENGTH = vehicle2.length;
            Class1.veh_LINK = vehicle2.linkid;
            Class1.veh_SPEED = vehicle2.speed;
            Class1.veh_WEIGHT = vehicle2.weight;
            Class1.veh_LINKCOORD = vehicle2.coord;
            Class1.veh_ACCELERATION = vehicle2.acce;
            Class1.veh_HEIGHT = vehicle2.height;
            Class1.veh_DISTANCE = vehicle2.distance;
            Class1.SIMRES = vehicle2.simres;//仿真精度
            Class1.SIMPERIOD = vehicle2.simperiod;
            Class1.all_LINK = vehicle2.alllinkid;
            Class1.all_LINKLENGTH = vehicle2.alllinklen;
            Class1.next_LINK = vehicle2.nextlink;
            Class1.TIME = vehicle2.simsec;
            Class1 c = new Class1();
            vehicle2.speed = c.arithmetic_veh_speed();
            vehicle2.coord = c.arithmetic_veh_linkcoord();
            vehicle2.linkid = c.arithmetic_veh_link();
            vehicle2.laneid = c.arithmetic_veh_lane();
        }
    }
}
