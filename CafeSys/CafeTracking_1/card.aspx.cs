using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace CafeTracking_1
{
    public partial class card : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string UpdateProductStock(string productName, int quantity)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                   
                    string query = "UPDATE product_Tbl SET current_stock = current_stock - @Quantity WHERE product_name = @ProductName";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            return "Stock updated successfully.";
                        }
                        else
                        {
                            return "Error: Product not found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    return "Error: " + ex.Message;
                }
            }
        }
    }
}
