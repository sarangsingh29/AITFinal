using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["validLogin"] == null || (Boolean)Session["validLogin"] == false)
            Response.Redirect("~/Default.aspx");
        DataBind();
    }
    protected void done(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }
}
