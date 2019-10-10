using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//xz
namespace v2x
{
    class vehicle
    {
        public double ID;
        public status status1 = new status();
        public path path1 = new path();
        public int matchsectionresult = 0;
        public int matchlaneResult = 0;
        public int matchlinkResult = 0;
        public int shibie = 3;//3为未识别 0connector 1进口道 2出口道
        public int shabi = 0;
        public int shabi2 = 0;
        public void mapmatch()
        {
            shabi = 0;
            shabi2 = 0;
            shibie = 3;
            List<section> candidataSections = new List<section>();
            List<connector> candidatacon = new List<connector>();
            for (int i = 0; i < total.intsection1.linksin.Count; i++)
            {
                for (int j = 0; j < total.intsection1.linksin[i].lanes.Count; j++)//1st step: direction linkin
                {
                    for (int k = 0; k < total.intsection1.linksin[i].lanes[j].sections.Count; k++)
                        if (Math.Abs(status1.angle - total.intsection1.linksin[i].lanes[j].sections[k].angle) < 15)
                        {
                            candidataSections.Add(total.intsection1.linksin[i].lanes[j].sections[k]);
                        }
                }
            }
            for (int i = 0; i < total.intsection1.linksout.Count; i++)
            {
                for (int j = 0; j < total.intsection1.linksout[i].lanes.Count; j++)//1st step: direction linkout
                {
                    for (int k = 0; k < total.intsection1.linksout[i].lanes[j].sections.Count; k++)
                        if (Math.Abs(status1.angle - total.intsection1.linksout[i].lanes[j].sections[k].angle) < 15)
                        {
                            candidataSections.Add(total.intsection1.linksout[i].lanes[j].sections[k]);
                        }
                }
            }
            if (path1.laneend != null && path1.lanestart != null)//?
            {
                if (path1.lanestart.sections.Count > 0 && path1.laneend.sections.Count > 0)
                    if (Math.Abs(status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle) < 90 || status1.angle - path1.laneend.sections[0].angle < 90)
                    {
                        candidatacon.Add(path1.con);
                    }
            }
            if (candidataSections.Count + candidatacon.Count == 0)//没有符合的话
            {
                status1.lane1.ID = 0;
                status1.linkid = 0;
                status1.sectionid = 0;
                status1.y = 0;
                shibie = 3;
            }
            else
            {
                double minDiff = 20;
                for (int i = 0; i < candidataSections.Count; i++)
                {
                    if (candidataSections[i].geterror(status1.position) < 20 && candidataSections[i].geterror(status1.position) < minDiff)//距离匹配 误差比较满足要求 
                    {
                        status1.lane1.ID = candidataSections[i].laneid;
                        for (int j = 0; j < total.intsection1.linksin.Count; j++)
                            for (int k = 0; k < total.intsection1.linksin[j].lanes.Count; k++)
                                if (status1.lane1.ID == total.intsection1.linksin[j].lanes[k].ID)
                                {
                                    path1.lanestart = total.intsection1.linksin[j].lanes[k];
                                    status1.lane1 = total.intsection1.linksin[j].lanes[k];
                                    shibie = 1;//在进口道
                                }
                        if(shibie!=1){
                        for (int j = 0; j < total.intsection1.linksout.Count; j++)
                            for (int k = 0; k < total.intsection1.linksout[j].lanes.Count; k++)
                                if (status1.lane1.ID == total.intsection1.linksout[j].lanes[k].ID)
                                {
                                    status1.lane1 = total.intsection1.linksout[j].lanes[k];
                                    shabi = total.intsection1.linksout[j].lanes[k].ID;
                                    shabi2 = status1.lane1.ID;
                                        shibie = 2;//在出口道
                                }
                        }
                        status1.linkid = candidataSections[i].linkid;
                        status1.sectionid = candidataSections[i].id;
                        status1.y = 0;
                        minDiff = candidataSections[i].geterror(status1.position);
                    }

                }
                section section1 = new section();
                if (path1.lanestart.sections.Count > 0 && path1.laneend.sections.Count > 0)
                    if (section1.getdistance(status1.position, path1.lanestart.sections[0].start) > path1.lanestart.length && section1.getdistance(status1.position, path1.laneend.sections[path1.laneend.sections.Count - 1].end) > path1.laneend.length)
                    {
                        if (path1.con.geterror(status1.position) < 10)
                        {
                    shibie = 0;//在connector
                    status1.conid = path1.con.ID;
                
                        }
        }
            }
        }
        public void caly()
        {
            if (path1.lanestart.ID > 0)
            {
                status1.y = 0;
                if (shibie == 0)//若在connector y为进口道长度+connector内长度
                {

                    if (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle != 0)//section[0]前laneend修改完成
                    {
                        if (status1.conid == 10007)
                        {
                            for (int i = 0; i < path1.lanestart.sections.Count; i++)
                                if (status1.sectionid == path1.lanestart.sections[i].id)
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                                }
                                else
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].length;
                                }
                            status1.y = (status1.y - status1.a) ;//与vissim匹配 22为实际长度 32.8为vissim长度
                        }
                        else if (status1.conid == 30005)
                        {
                            for (int i = 0; i < path1.lanestart.sections.Count; i++)
                                if (status1.sectionid == path1.lanestart.sections[i].id)
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                                }
                                else
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].length;
                                }
                            status1.y = (status1.y - status1.a);
                        }
                        else if (status1.conid == 40006)
                        {
                            for (int i = 0; i < path1.lanestart.sections.Count; i++)
                                if (status1.sectionid == path1.lanestart.sections[i].id)
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                                }
                                else
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].length;
                                }
                            status1.y = (status1.y - status1.a);
                        }
                        else if (status1.conid == 20008)
                        {
                            for (int i = 0; i < path1.lanestart.sections.Count; i++)
                                if (status1.sectionid == path1.lanestart.sections[i].id)
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                                }
                                else
                                {
                                    status1.y = status1.y + path1.lanestart.sections[i].length;
                                }
                            status1.y = (status1.y - status1.a);
                        }
                        else
                        #region 开始秀
                        {
                            if(Math.Abs(path1.laneend.sections[0].angle- path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle)>180 && path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle>0)
                            {
                                if (Math.Abs(status1.angle- path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle)>180)
                                    status1.y= (status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle-360) / (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle-360) * path1.con.length;
                                else
                                    status1.y = (status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle ) / (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle - 360) * path1.con.length;
                            }
                            else if(Math.Abs(path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle) > 180 && path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle < 0)
                            {
                                if(Math.Abs(status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle)>180)
                                    status1.y = (status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle+360) / (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle+360) * path1.con.length;
                                else
                                    status1.y = (status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle) / (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle+360) * path1.con.length;
                            }
                            else
                            status1.y = (status1.angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle) / (path1.laneend.sections[0].angle - path1.lanestart.sections[path1.lanestart.sections.Count - 1].angle) * path1.con.length;
                        }
                        #endregion 秀结束

                    }

                }
                else if (shibie == 1)//若在进口道 y为距离
                {
                    for (int i = 0; i < path1.lanestart.sections.Count; i++)
                        if (status1.sectionid == path1.lanestart.sections[i].id)
                        {
                            status1.y = path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                            //status1.y = status1.y + path1.lanestart.sections[i].getdistance(path1.lanestart.sections[i].start, status1.position);
                        }
                        else
                        {
                            status1.y = status1.y + path1.lanestart.sections[i].length;
                        }
                    status1.a = status1.y;
                }
                else if (shibie == 2)//若在出口道 y为多段相加
                {
                    for (int i = 0; i < path1.laneend.sections.Count; i++)
                        if (status1.sectionid == path1.laneend.sections[i].id)
                        {
                            status1.y = status1.y + path1.laneend.sections[i].getdistance(path1.laneend.sections[i].start, status1.position);
                        }
                        else
                        {
                            status1.y = status1.y + path1.laneend.sections[i].length;
                        }

                }
            }
            status1.y = Math.Abs(status1.y);
        }
    }
}
