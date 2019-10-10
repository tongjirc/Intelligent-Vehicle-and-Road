using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class lane
    {
        public int ID;
        GPSpoint start = new GPSpoint();
        GPSpoint end = new GPSpoint();
        public double length;
        public double vmax;
        public double vmin;
        public void getlength()
        { }
        public List<section> sections = new List<section>();//为什么一个lane由多个section
    
    }
}
