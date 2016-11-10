using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class secretary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void finNextBut(object sender, EventArgs e)
    {
        int step = addFinanceWizard.ActiveStepIndex;
        String text = "";
        text += "Name: " + donorBox.Text+"\n";
        text += "Amount: " + amountBox.Text + "\n";
        text += "Date: " + finCal.SelectedDate.ToString();
        confirmBox.Text = text;
    }
    protected void ordNextBut(object sender, EventArgs e)
    {
        int step = orderWizard.ActiveStepIndex;
        String text = "";
        text += "Item: " + ordList.SelectedItem.Text + "\n";
        text += "Quantity: " + ordQty.Text + "\n";
        text += "Price: " + (Convert.ToInt32(ordList.SelectedValue)) * (Convert.ToInt32(ordQty.Text));
        ordConfirmBox.Text = text;
    }
    protected void acadSave(object sender, EventArgs e)
    { 
        //Save academic activity
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False");
        String query = "insert into academic values('"+acadTitle.Text+"','"+acadAuthor.Text+"','"+acadDesc.Text+"')";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        int rows = cmd.ExecuteNonQuery();
        conn.Close();
        acadMsgLabel.Text = "Rows Updated: " + rows;
    }

    protected void orderSave(object sender, EventArgs e)
    {
        //Save academic activity
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False");
        String query = "update inventory set quantity=quantity+"+ordQty.Text+" where item like('"+ordList.SelectedItem.Text+"')";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        int rows = cmd.ExecuteNonQuery();
        conn.Close();
        ordMsgLabel.Text = "Rows Updated: " + rows;
    }

    protected void finSave(object sender, EventArgs e)
    {
        //Save academic activity
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False");
        String date=finCal.SelectedDate.ToString().Split(' ')[0];
        String query = "insert into finance values('" + donorBox.Text + "','" + amountBox.Text + "','" +date+ "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        int rows = cmd.ExecuteNonQuery();
        conn.Close();
        finMsgLabel.Text = "Rows Updated: " + rows;
    }

    protected void finFileSave(object sender, EventArgs e)
    {
        String fileName = donorBox.Text +new Random().Next(1,100)+".txt";
        StreamWriter sw=File.CreateText(Server.MapPath("~")+"/Receipts/"+fileName);
        sw.WriteLine((String)Session["department"] + ":");
        sw.WriteLine("Date: " + finCal.SelectedDate.ToString());
        sw.WriteLine("Donor: " + donorBox.Text);
        sw.WriteLine("Amount:" + amountBox.Text);
        sw.WriteLine("Verified By:" + (String)Session["name"]);
        sw.Close();
        finMsgLabel.Text = "File Saved as " + fileName;
    }

    protected void wizardFinish(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
}