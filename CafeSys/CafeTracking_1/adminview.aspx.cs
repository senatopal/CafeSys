using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CafeTracking_1
{
    public partial class adminview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnShowMembers_Click(object sender, EventArgs e)
        {
            if (GridViewMembers.Visible)
            {
                GridViewMembers.Visible = false;
            }
            else
            {
                BindMembersGrid();
                GridViewMembers.Visible = true;
            }
        }

        protected void btnShowAdminCount_Click(object sender, EventArgs e)
        {
            if (adminCountBox.Visible)
            {
                adminCountBox.Visible = false;
            }
            else
            {
                string adminCount = GetAdminCount();
                lblAdminCount.Text = adminCount;
                adminCountBox.Visible = true;
            }
        }

        protected void btnShowLowStock_Click(object sender, EventArgs e)
        {
            if (GridViewLowStock.Visible)
            {
                GridViewLowStock.Visible = false;
            }
            else
            {
                BindLowStockProducts();
                GridViewLowStock.Visible = true;
            }
        }

        protected void btnShowTopSelling_Click(object sender, EventArgs e)
        {
            if (GridViewTopSelling.Visible)
            {
                GridViewTopSelling.Visible = false;
            }
            else
            {
                BindTopSellingProducts();
                GridViewTopSelling.Visible = true;
            }
        }

        private string GetAdminCount()
        {
            string adminCountMessage = "Admin count: ";

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT dbo.GetAdminsCount()", con);
                    con.Open();

                    var result = cmd.ExecuteScalar();
                    adminCountMessage += result.ToString();
                }
            }
            catch (Exception ex)
            {
                adminCountMessage = "Error: " + ex.Message;
            }

            return adminCountMessage;
        }

        private void BindMembersGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM vw_member", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridViewMembers.DataSource = dt;
                        GridViewMembers.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No member information found.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private void BindLowStockProducts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.GetLowStockProducts()", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridViewLowStock.DataSource = dt;
                        GridViewLowStock.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No products found below 50 in stock.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private void BindTopSellingProducts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.GetTopSellingProducts()", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridViewTopSelling.DataSource = dt;
                        GridViewTopSelling.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No top selling products found.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
