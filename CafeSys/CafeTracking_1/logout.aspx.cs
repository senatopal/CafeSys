using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CafeTracking_1
{
    public partial class logout : Page
    {
       
        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
        
            Session.Clear();
            Response.Redirect("~/homepage.aspx");
        }

       
        protected void ButtonDeleteAccount_Click(object sender, EventArgs e)
        {
          
            deleteAccountsection.Style["display"] = "block";
        }

      
        protected void ButtonDeleteAccountConfirm_Click(object sender, EventArgs e)
        {
            
            string memberId = memberid.Text.Trim();
            string memberPassword = memberpassword.Text.Trim();

            bool isDeleted = DeleteAccount(memberId, memberPassword);

       
            Response.Write("<script>alert('Your account has been deleted successfully.');</script>");
            Session.Clear();
            Response.Redirect("~/homepage.aspx");
            
        }

  
        private bool DeleteAccount(string memberId, string memberPassword)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                con.Open();

            
                SqlCommand deleteLogsCmd = new SqlCommand("DELETE FROM password_LogTbl WHERE member_id = (SELECT member_id FROM memberSignup_Tbl WHERE full_name = @full_name AND password = @password)", con);
                deleteLogsCmd.Parameters.AddWithValue("@full_name", memberId);
                deleteLogsCmd.Parameters.AddWithValue("@password", memberPassword);
                deleteLogsCmd.ExecuteNonQuery();

                
                SqlCommand deleteMemberCmd = new SqlCommand("DELETE FROM memberSignup_Tbl WHERE full_name = @full_name AND password = @password", con);
                deleteMemberCmd.Parameters.AddWithValue("@full_name", memberId);
                deleteMemberCmd.Parameters.AddWithValue("@password", memberPassword);

                int rowsAffected = deleteMemberCmd.ExecuteNonQuery();

                return rowsAffected > 0;
            }



        }
    }
}
