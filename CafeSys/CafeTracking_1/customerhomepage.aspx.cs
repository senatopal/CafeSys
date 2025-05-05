using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CafeTracking_1
{
    public partial class customerhomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
          
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

      
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
            
                string query = "INSERT INTO contact_Tbl (person_name, mail, message) VALUES (@Name, @Email, @Message)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
               
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Message", message);

                   
                    connection.Open();
                    int result = command.ExecuteNonQuery(); 
                  
                    if (result > 0)
                    {
                 
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your message has been sent successfully!');", true);
                    }
                    else
                    {
                       
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('There was an error sending your message. Please try again.');", true);
                    }
                }
            }
        }
    }
}