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
    public partial class Form1 : Form
    {
        public string password = "1212";
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Equals("Harsh") && textBox2.Text.Equals(password))
            {
                MessageBox.Show("Successful Login!");
                Form2 f = new Form2();
                f.Show();
            }

            else {
                MessageBox.Show("Wrong Details");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4(this);
            f4.Show();
        }
    }
}
