using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CafeTracking_1
{
    public partial class usersignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string fullName = TextBox1.Text;
            string dateOfBirth = TextBox2.Text;
            string contactNumber = TextBox3.Text;
            string emailId = TextBox4.Text;
            string state = DropDownList1.SelectedValue;
            string city = TextBox5.Text;
            string pincode = TextBox7.Text;
            string fullAddress = TextBox6.Text;
            string password = TextBox8.Text;
            string memberId = Guid.NewGuid().ToString(); 
            string accountStatus = "Active"; 

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("AddNewMember", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                    command.Parameters.AddWithValue("@ContactNumber", contactNumber);
                    command.Parameters.AddWithValue("@EmailId", emailId);
                    command.Parameters.AddWithValue("@State", state);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@Pincode", pincode);
                    command.Parameters.AddWithValue("@FullAddress", fullAddress);
                    command.Parameters.AddWithValue("@MemberId", memberId); // Unique ID
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@AccountStatus", accountStatus);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    Response.Write("<script>alert('Registration Successful!');</script>");
                }
            }
        }
    }
}
