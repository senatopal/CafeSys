using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CafeTracking_1
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("seat.aspx");
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("logout.aspx"); 
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
        
            Response.Redirect("cardadmin.aspx"); 
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("menusadmin.aspx"); 
        }
       
    }
    }
