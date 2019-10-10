using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class section
    {
        public int id;
        public int laneid;
        public int linkid;
        public GPSpoint start = new GPSpoint();
        public GPSpoint end = new GPSpoint();
        public double length;
        public double angle;
        public void getlength()
        {
            length = getdistance(start, end);
        }
        public double geterror(GPSpoint e)
        {
            double err = getdistance(e, start) + getdistance(e, end) - getdistance(start, end);
            return err;
        }
        private static double rad(double d)
        {
            return d * Math.PI / 180.0;
        }
        private const double EARTH_RADIUS = 6378137;
        public double getdistance(GPSpoint p, GPSpoint h)
        {
            double s = Math.Sqrt((Math.Pow(p.lati - h.lati, 2.0) + Math.Pow(p.lonti - h.lonti, 2.0))) * 10.0; //相对距离放大十倍
            return s;


        }
    }
}
