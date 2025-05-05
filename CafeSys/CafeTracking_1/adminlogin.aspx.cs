using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CafeTracking_1
{
    public partial class adminlogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string adminId = Admini.Text;
            string adminPassword = AdminP.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("CheckAdminLogin", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@AdminId", adminId);
                    command.Parameters.AddWithValue("@AdminPassword", adminPassword);

                   
                    SqlParameter returnValue = new SqlParameter();
                    returnValue.Direction = ParameterDirection.ReturnValue;
                    command.Parameters.Add(returnValue);

                    connection.Open();
                    command.ExecuteNonQuery(); 
                    int result = (int)returnValue.Value;

                    if (result == 1) 
                    {
                        string script = "alert('Login successful'); setTimeout(function() { window.location = 'adminhomepage.aspx'; }, 2000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    else 
                    {
                        Response.Write("<script>alert('Invalid Admin ID or Password');</script>");
                    }
                }
            }
        }
    }
}
