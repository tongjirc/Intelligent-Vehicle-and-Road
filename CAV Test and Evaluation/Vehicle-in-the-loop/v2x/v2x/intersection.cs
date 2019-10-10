using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class intersection
    {
        public int ID;
        public List<link> linksin = new List<link>();
        public List<link> linksout = new List<link>();
        public List<connector> connectors = new List<connector>();
        public int[] X1 = new int[144];
        public double[] X2 = new double[144];
    }
}
