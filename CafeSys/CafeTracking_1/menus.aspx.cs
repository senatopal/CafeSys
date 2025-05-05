using System;
using System.Data.SqlClient;
using System.Configuration;

namespace CafeTracking_1
{
    public partial class menus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenuItems();
            }
        }

        private void LoadMenuItems()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT product_name, product_price FROM product_Tbl";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string productName = reader["product_name"].ToString();
                            string productPrice = reader["product_price"].ToString();

                           
                            Page.ClientScript.RegisterStartupScript(this.GetType(), productName,
                                $"updatePrice('{productName}', '{productPrice}');", true);
                        }
                    }
                }
            }

        }
    }
}