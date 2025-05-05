using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CafeTracking_1
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fullName = TextBox1.Text;
            string password = TextBox2.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("CheckUser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@Password", password);

                    
                    SqlParameter returnValue = new SqlParameter();
                    returnValue.Direction = ParameterDirection.ReturnValue;
                    command.Parameters.Add(returnValue);

                    connection.Open();
                    command.ExecuteNonQuery(); 

                   
                    int result = (int)returnValue.Value;

                    if (result == 1) 
                    {
                        string script = "alert('Login successful'); setTimeout(function() { window.location = 'customerhomepage.aspx'; }, 2000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    else 
                    {
                        Response.Write("<script>alert('Invalid member ID or password');</script>");
                    }
                }
            }
        }



    }
}