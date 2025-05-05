using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CafeTracking_1
{
    public partial class homepage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //EMPTY AREA
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
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

        protected void btnShowReviews_Click(object sender, EventArgs e)
        {
            string reviews = GetReviews();
            
            ClientScript.RegisterStartupScript(this.GetType(), "OpenModal", "openReviewsModal('" + reviews.Replace("'", "\\'") + "');", true);
        }

        private string GetReviews()
        {
            string reviewsHtml = "";
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetCustomerReviews", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        reviewsHtml += "<div class='review-card'><h5>" + reader["person_name"] + "</h5><p>\"" + reader["message"] + "\"</p></div>";
                    }
                }
            }
            return reviewsHtml;
        }
    }
}