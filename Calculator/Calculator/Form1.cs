using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        string opr;
        double op1, op2, result;
        

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 1;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 2;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 3;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 4;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 5;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 6;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 7;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 8;
        }

        private void button9_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 9;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text + 0;
        }

        private void button12_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Contains("."))
            {
                textBox1.Text = textBox1.Text;
            }
            else
            {
                textBox1.Text = textBox1.Text + ".";
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
        }

        private void button13_Click(object sender, EventArgs e)
        {
            op1 = Convert.ToDouble(textBox1.Text);
            opr = "+";
            textBox1.Clear();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            op1 = Convert.ToDouble(textBox1.Text);
            opr = "-";
            textBox1.Clear();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            op1 = Convert.ToDouble(textBox1.Text);
            opr = "*";
            textBox1.Clear();
        }

        private void button16_Click(object sender, EventArgs e)
        {
            op1 = Convert.ToDouble(textBox1.Text);
            opr = "/";
            textBox1.Clear();
        }

        private void button17_Click(object sender, EventArgs e)
        {
            op2 = Convert.ToDouble(textBox1.Text);
            switch (opr) { 
                case "+":
                    result = op1 + op2;
                    textBox1.Text = Convert.ToString(result);
                    break;

                case "-":
                    result = op1 - op2;
                    textBox1.Text = Convert.ToString(result);
                    break;

                case "*":
                    result = op1 * op2;
                    textBox1.Text = Convert.ToString(result);
                    break;

                case "/":
                    if (op2 == 0) result = 0;
                    else result = op1 / op2;
                    textBox1.Text = Convert.ToString(result);
                    break;

                        
            }
        }

    }
}
