using System;
using System.Data.SqlClient;
using System.Configuration;

namespace CafeTracking_1
{
    public partial class productarrangement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string productId = txtProductId.Text.Trim();
            string productName = txtProductName.Text.Trim();
            string productPrice = txtProductPrice.Text.Trim();
            string actualStock = txtActualStock.Text.Trim();
            string currentStock = txtCurrentStock.Text.Trim();

            if (string.IsNullOrEmpty(productId))
            {
                lblMessage.Text = "Product ID is required.";
                return;
            }

            UpdateProduct(productId, productName, productPrice, actualStock, currentStock);
            lblMessage.Text = "Product updated successfully!";
            ClearFields();
        }

        private void UpdateProduct(string productId, string productName, string productPrice, string actualStock, string currentStock)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
              
                string query = "UPDATE product_Tbl  SET ";
                bool hasSetClause = false;

                if (!string.IsNullOrEmpty(productName))
                {
                    query += "product_name = @productName";
                    hasSetClause = true;
                }

                if (!string.IsNullOrEmpty(productPrice))
                {
                    if (hasSetClause) query += ", ";
                    query += "product_price = @productPrice";
                    hasSetClause = true;
                }

                if (!string.IsNullOrEmpty(actualStock))
                {
                    if (hasSetClause) query += ", ";
                    query += "actual_stock = @actualStock";
                    hasSetClause = true;
                }

                if (!string.IsNullOrEmpty(currentStock))
                {
                    if (hasSetClause) query += ", ";
                    query += "current_stock = @currentStock";
                }

                query += " WHERE product_id = @productId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@productId", productId);
                    if (!string.IsNullOrEmpty(productName)) command.Parameters.AddWithValue("@productName", productName);
                    if (!string.IsNullOrEmpty(productPrice)) command.Parameters.AddWithValue("@productPrice", productPrice);
                    if (!string.IsNullOrEmpty(actualStock)) command.Parameters.AddWithValue("@actualStock", actualStock);
                    if (!string.IsNullOrEmpty(currentStock)) command.Parameters.AddWithValue("@currentStock", currentStock);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void ClearFields()
        {
            txtProductId.Text = string.Empty;
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            txtActualStock.Text = string.Empty;
            txtCurrentStock.Text = string.Empty;
        }
    }
}