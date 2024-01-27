using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BankingInterface
{
    public partial class Form4 : Form
    {
        Form1 f;
        public Form4(Form1 f)
        {
            this.f = f;
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string old = textBox1.Text;
            string NewPass = textBox2.Text;
            if (old == f.password && NewPass != "")
            {
                f.password = NewPass;
                MessageBox.Show("Password Updated!");
               
            }
            else {
                MessageBox.Show("Wrong Details. Re-enter Details");
            }
        }
    }
}
