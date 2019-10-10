using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace v2x
{
    class status
    {
        public double speed=0;
        public GPSpoint position = new GPSpoint();
        public double angle=0;
        public lane lane1 = new lane();
        public int linkid=0;
        public int sectionid=0;
        public double acceleration=0;
        public int conid=0;
        public double y=0;//在路段上的位置
        public double a=0;//记录start长度
    }
}
