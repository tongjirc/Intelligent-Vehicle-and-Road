using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class path
    {
        public lane lanestart = new lane();
        public lane laneend = new lane();
        public connector con = new connector();
        public double y2;
        public void findend()
        {
            if (laneend.ID == 0)//未读取成功
            { }
            else
            {
                for (int j = 0; j < total.intsection1.linksout.Count; j++)
                    for (int k = 0; k < total.intsection1.linksout[j].lanes.Count; k++)
                    {
                        if (total.intsection1.linksout[j].lanes[k].ID == laneend.ID)
                            laneend = total.intsection1.linksout[j].lanes[k];
                    }
            }
        }
        public void getcon()
        {
            if (lanestart != null && laneend != null)
            {
                for (int i = 0; i < total.intsection1.connectors.Count; i++)
                {
                    if (total.intsection1.connectors[i].lanestart.ID == lanestart.ID)
                        if (total.intsection1.connectors[i].laneend.ID == laneend.ID)
                            con = total.intsection1.connectors[i];
                }
            }
        }
    }
}
