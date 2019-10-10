using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
//xz
namespace v2x
{
    class readmap
    {
        StreamReader sr;//读取初始文件
        FileStream fs;
        public void getMap()
        {
            total.intsection1.linksin.Clear();
            total.intsection1.linksout.Clear();
            total.intsection1.ID = 1;
            total.intsection1.connectors.Clear();
            var gb18030 = Encoding.GetEncoding("GB18030");
            List<intersection> intersection1 = new List<intersection>();
            fs = new FileStream(Application.StartupPath + "\\campus test.txt", FileMode.Open);
            sr = new StreamReader(fs, gb18030, true);
            string intersectionStr = "";
            string X1str = "";
            string X2str = "";
            string linkin_id = "";
            string linkout_id = "";
            string connector_info = "";
            string connect = "";
            int linkin_num;
            int linkout_num;
            string lane_count = "";
            string lane_id = "";

            intersectionStr = sr.ReadLine();
            while (intersectionStr != null)
            {
                intersection newIntersection = new intersection();
                newIntersection.ID = Convert.ToInt32(intersectionStr.Split('|')[0]);
                //MessageBox.Show("jiahchakoubianhao" + newIntersection.intersectionnum);
                linkin_num = Convert.ToInt32(intersectionStr.Split('|')[1]);
                //MessageBox.Show("jiahchakouname" + newIntersection.intersectionname);
                linkout_num = Convert.ToInt32(intersectionStr.Split('|')[2]);
                //MessageBox.Show("jiahchakoubianhao" + numOfRoads);
                linkin_id = Convert.ToString(intersectionStr.Split('|')[3]);
                linkout_id = Convert.ToString(intersectionStr.Split('|')[4]);
                lane_count = Convert.ToString(intersectionStr.Split('|')[5]);
                lane_id = Convert.ToString(intersectionStr.Split('|')[6]);
                int[] linkin = new int[linkin_num];
                int[] linkout = new int[linkout_num];

                for (int i = 0; i < linkin_num; i++)
                {
                    link link1 = new link();
                    link1.ID = Convert.ToInt32(linkin_id.Split(',')[i]);
                    total.intsection1.linksin.Add(link1);

                }
                for (int i = 0; i < linkout_num; i++)
                {
                    link link1 = new link();
                    link1.ID = Convert.ToInt32(linkout_id.Split(',')[i]);
                    total.intsection1.linksout.Add(link1);
                }
                int a = 0;
                for (int i = 0; i < linkin_num; i++)
                {

                    linkin[i] = Convert.ToInt32(lane_count.Split(',')[i]);
                    for (int j = 0; j < linkin[i]; j++)
                    {
                        a += linkin[i];
                        lane lane1 = new lane();
                        lane1.ID = Convert.ToInt32(lane_id.Split(',')[a - 1]);
                        total.intsection1.linksin[i].lanes.Add(lane1);
                    }
                }
                int b = 0;
                for (int i = 0; i < linkout_num; i++)
                {

                    linkout[i] = Convert.ToInt32(lane_count.Split(',')[i + linkin_num]);
                    for (int j = 0; j < linkout[i]; j++)
                    {
                        b += linkout[i];
                        lane lane1 = new lane();
                        lane1.ID = Convert.ToInt32(lane_id.Split(',')[a + b - 1]);
                        total.intsection1.linksout[i].lanes.Add(lane1);
                    }
                }
                connector_info = Convert.ToString(intersectionStr.Split('|')[7]);
                for (int i = 0; i < (linkin_num * (linkout_num - 1)); i++)
                {
                    connect = Convert.ToString(connector_info.Split('/')[i]);
                    connector c1 = new connector();//connector
                    //MessageBox.Show("duhaole" + connect);
                    c1.ID = Convert.ToInt32(connect.Split(',')[0]);
                    int start;
                    int end;
                    start = Convert.ToInt32(connect.Split(',')[1]);
                    end = Convert.ToInt32(connect.Split(',')[2]);
                    if (start <= linkin_num)
                    {
                        c1.lanestart = total.intsection1.linksin[start - 1].lanes[0];
                        c1.laneend = total.intsection1.linksout[end - 1 - linkin_num].lanes[0];
                    }
                    c1.length = Convert.ToDouble(connect.Split(',')[3]);
                    c1.vmax = Convert.ToDouble(connect.Split(',')[4]) / 3.6;
                    c1.vmin = Convert.ToDouble(connect.Split(',')[5]) / 3.6;
                    c1.angle = Convert.ToDouble(connect.Split(',')[6]);
                    total.intsection1.connectors.Add(c1);
                }
                X1str = Convert.ToString(intersectionStr.Split('|')[8]);//冲突矩阵
                for (int i = 0; i < 144; i++)
                {
                    total.intsection1.X1[i] = Convert.ToInt32(X1str.Split(',')[i]);
                }
                X2str = Convert.ToString(intersectionStr.Split('|')[9]);//冲突距离矩阵
                for (int i = 0; i < 144; i++)
                {
                    total.intsection1.X2[i] = Convert.ToDouble(X2str.Split(',')[i]);
                }
                int a1 = 0;
                for (int i = 0; i < linkin.Length; i++)
                {
                    for (int j = 0; j < linkin[i]; j++)
                    {
                        a1 += linkin[i];//linkin都为1
                        string section = Convert.ToString(intersectionStr.Split('|')[9 + a1]);
                        int section_num = Convert.ToInt32(section.Split(',')[0]);
                        section section1 = new section();
                        for (int k = 0; k < section_num; k++)
                        {
                            section1.id = Convert.ToInt32(section.Split(',')[5 * k + 1]);
                            section1.start.lonti = Convert.ToDouble(section.Split(',')[5 * k + 2]);
                            section1.start.lati = Convert.ToDouble(section.Split(',')[5 * k + 3]);
                            section1.end.lonti = Convert.ToDouble(section.Split(',')[5 * k + 4]);
                            section1.end.lati = Convert.ToDouble(section.Split(',')[5 * k + 5]);
                            section1.length = Convert.ToDouble(section.Split(',')[5 * k + 6]);
                            section1.angle = Convert.ToDouble(section.Split(',')[5 * k + 7]);
                            section1.getlength();
                            total.intsection1.linksin[i].lanes[j].length += section1.length;
                            //section1.getangle();

                            section1.laneid = total.intsection1.linksin[i].lanes[j].ID;
                            section1.linkid = total.intsection1.linksin[i].ID;
                        }
                        total.intsection1.linksin[i].lanes[j].sections.Add(section1);

                    }
                }
                int b1 = 0;
                for (int i = 0; i < linkout.Length; i++)
                {
                    for (int j = 0; j < linkout[i]; j++)
                    {
                        b1 += linkout[i];
                        string section = Convert.ToString(intersectionStr.Split('|')[9 + a1 + b1]);
                        int section_num = Convert.ToInt32(section.Split(',')[0]);
                        section section1 = new section();
                        for (int k = 0; k < section_num; k++)
                        {
                            section1.id = Convert.ToInt32(section.Split(',')[5 * k + 1]);
                            section1.start.lonti = Convert.ToDouble(section.Split(',')[5 * k + 2]);
                            section1.start.lati = Convert.ToDouble(section.Split(',')[5 * k + 3]);
                            section1.end.lonti = Convert.ToDouble(section.Split(',')[5 * k + 4]);
                            section1.end.lati = Convert.ToDouble(section.Split(',')[5 * k + 5]);
                            section1.length = Convert.ToDouble(section.Split(',')[5 * k + 6]);
                            section1.angle = Convert.ToDouble(section.Split(',')[5 * k + 7]);
                            section1.getlength();
                            total.intsection1.linksout[i].lanes[j].length += section1.length;
                            //section1.getangle();
                            //直接读取角度                     
                            section1.laneid = total.intsection1.linksout[i].lanes[j].ID;
                            section1.linkid = total.intsection1.linksout[i].ID;
                        }
                        total.intsection1.linksout[i].lanes[j].sections.Add(section1);
                    }
                }
                intersectionStr = sr.ReadLine();
            }
            sr.Close();
            fs.Close();
        }
    }
}
