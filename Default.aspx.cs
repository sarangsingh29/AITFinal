using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;
        //Save academic activity
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=DBAIT;Integrated Security=True;Pooling=False");
        String query = "select * from login where id="+id.Text;
       
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter adap=new SqlDataAdapter(cmd);

        DataSet ds=new DataSet();
        conn.Open();
        adap.Fill(ds,"login");
        conn.Close();

        String selectedType="";

        String getType;
        String getName;
        String getDept;
        String getPass;

        String url="~/Default.aspx";

        if (test1.Checked)
        {
            selectedType = "stu";
            url = "~/student.aspx";
        }
        else if (test2.Checked)
        {
            selectedType = "sec";
            url = "~/secretary.aspx";
        }
        else if (test3.Checked)
        {
            selectedType = "ins";
            url = "~/instructor.aspx";
        }
        
        if(ds.Tables["login"].Rows.Count==0)
        {
            errMsgLabel.Text="Unknown UniqueID";
        }
        else
        {
             getPass=(string)ds.Tables["login"].Rows[0]["password"];
             getType=(string)ds.Tables["login"].Rows[0]["type"];
             getDept=(string)ds.Tables["login"].Rows[0]["department"];
             getName=(string)ds.Tables["login"].Rows[0]["name"];
             if(!getPass.Equals(password.Text))
             {
                errMsgLabel.Text="Wrong Password";
             }
             else if(!getType.Equals(selectedType))
             {
                errMsgLabel.Text="Wrong Type";
             }
             else
             {
                Session["name"]=getName;
                Session["type"]=getType;
                Session["dept"]=getDept;
                Session["validLogin"] = true;
                Response.Redirect(url);
             }
        }
        
    }
    protected void customValidFunc(object sender, ServerValidateEventArgs e)
    {
        if (test1.Checked == false && test2.Checked == false && test3.Checked == false)
            e.IsValid = false;
    }
}