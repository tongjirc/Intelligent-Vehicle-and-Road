using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VISSIMLIB;

//仿真参数类
namespace v2x
{
    public class  simu1
    {
        //静态成员
        public static Vissim vissim;
        public static string path;//vissim路径
        public static ISimulation sim;
        public static INet net;
        public static IVehicleContainer vehicles;
        public static IVehicle vehicle;
        public static int itemTimeStep;
        public static IVehicleInputContainer vehiclein1;
        public static string connstr = @"server=.\sqlexpress;database=V2X;integrated security=SSPI";//连接字符串
        

        //动态成员
        //public ISimulation sim1;
        //public INet net1;
        //public IVehicleContainer vehicles1;
        //public IVehicle vehicle1;

    }
}
