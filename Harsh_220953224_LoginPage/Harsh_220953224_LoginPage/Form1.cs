using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Harsh_220953224_LoginPage
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {


        }

        private void button1_Click(object sender, EventArgs e)
        {
           
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            String var1;
            var1 = textBox1.Text;
            String var2;
            var2 = textBox2.Text;
            if (var1 == "Hello" && var2 == "password")
            {
                MessageBox.Show("Welcome");
            }
            else
            {
                MessageBox.Show("Enter 'Hello' and correct password");
            }
        }


    }
}
