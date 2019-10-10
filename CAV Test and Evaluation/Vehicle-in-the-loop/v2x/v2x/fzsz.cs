using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace v2x
{
    public partial class fzsz : UserControl
    {
        public fzsz()
        {
            InitializeComponent();
        }

        private void fzsz_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            simu1.sim.AttValue["SimPeriod"] = Convert.ToInt32(textBox1.Text);
            simu1.sim.AttValue["SimRes"] = Convert.ToInt32(textBox2.Text);//仿真精度
            simu1.sim.AttValue["SimSpeed"] = Convert.ToDouble(textBox3.Text);//仿真速度
            simu1.zdsk= Convert.ToInt32(textBox4.Text);
        }
    }
}
