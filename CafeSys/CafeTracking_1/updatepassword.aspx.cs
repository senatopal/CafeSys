using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CafeTracking_1
{
    public partial class updatepassword : Page
    {
        
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string previousPassword = txtPreviousPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(previousPassword) || string.IsNullOrEmpty(newPassword))
            {
                Response.Write("<script>alert('Please fill out all fields.');</script>");
                return;
            }

            bool isUpdated = UpdatePassword(name, previousPassword, newPassword);

            if (isUpdated)
            {
            
                Response.Write("<script>alert('Password updated successfully!');</script>");
            }
            else
            {
                
                Response.Write("<script>alert('Password update failed. Please check your credentials.');</script>");
            }
        }

       
        private bool UpdatePassword(string name, string previousPassword, string newPassword)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(
                        "UPDATE memberSignup_Tbl SET password = @newPassword WHERE full_name = @name AND password = @previousPassword", con);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@previousPassword", previousPassword);
                    cmd.Parameters.AddWithValue("@newPassword", newPassword);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
              
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }
        }
    }
}
