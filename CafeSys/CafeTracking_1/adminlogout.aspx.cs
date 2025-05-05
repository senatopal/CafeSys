using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CafeTracking_1
{
    public partial class adminlogout : Page
    {
       
        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
      
            Response.Write("<script>alert('Logged out successfully!');</script>");
        }

     
        protected void ButtonDeleteAccount_Click(object sender, EventArgs e)
        {
          
            deleteAccountsection.Style["display"] = "block";
        }

     
        protected void ButtonDeleteAccountConfirm_Click(object sender, EventArgs e)
        {
            
            string adminId = adminid.Text.Trim();
            string adminPassword = adminpassword.Text.Trim();

      

           
            bool isDeleted = DeleteAccount(adminId, adminPassword);

        
            Response.Write("<script>alert('Your account has been deleted successfully.');</script>");
            
            
        }

       
        private bool DeleteAccount(string adminId, string adminPassword) 
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                   
                    SqlCommand cmd = new SqlCommand("DELETE FROM admin_Tbl WHERE admin_id = @admin_id AND admin_password = @admin_password", con);
                    cmd.Parameters.AddWithValue("@admin_id", adminId);
                    cmd.Parameters.AddWithValue("@admin_password", adminPassword);

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