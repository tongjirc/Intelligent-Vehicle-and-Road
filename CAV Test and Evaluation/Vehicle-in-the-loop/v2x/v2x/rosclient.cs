using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ros_CSharp;

namespace v2x
{
    public class rosclient
    {
        static public NodeHandle node;
        static public void initROS()
        {
            string[] foo = { };
            ROS.Init(foo, "road");
        }

        static public void initNode()
        {
            node = new NodeHandle();
        }
    }
}
