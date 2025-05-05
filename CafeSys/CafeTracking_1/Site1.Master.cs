using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CafeTracking_1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("userlogin.aspx"); 
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("usersignup.aspx"); 
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            
            
            Response.Redirect("logout.aspx"); 
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("card.aspx"); 
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("menus.aspx"); 
        }
       
    }
}