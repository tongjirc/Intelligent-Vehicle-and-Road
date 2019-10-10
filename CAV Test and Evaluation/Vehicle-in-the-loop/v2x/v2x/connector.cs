using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class connector
    {
        public int ID;
        public lane lanestart = new lane();
        public lane laneend = new lane();
        public double length;
        public double vmax;
        public double vmin;
        public double speed;
        public double angle;
        public double geterror(GPSpoint e)
        {
            double err = getdistance(e, lanestart.sections[lanestart.sections.Count - 1].end) + getdistance(e, laneend.sections[0].start) - getdistance(lanestart.sections[lanestart.sections.Count - 1].end, laneend.sections[0].start);
            return err;
        }
        private static double rad(double d)//弧度值
        {
            return d * Math.PI / 180.0;
        }
        private const double EARTH_RADIUS = 6378137;
        public double getdistance(GPSpoint p, GPSpoint h)//计算GPS点之间的距离 弧线
        {
            double radLat1 = rad(p.lati);
            double radLat2 = rad(h.lati);
            double a = radLat1 - radLat2;
            double b = rad(p.lonti) - rad(h.lonti);

            double s = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) +
             Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2)));
            s = s * EARTH_RADIUS;
            s = Math.Round(s * 10000) / 10000;
            return s;

        }
    }
}
