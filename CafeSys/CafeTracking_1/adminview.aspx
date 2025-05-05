<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adminview.aspx.cs"
    Inherits="CafeTracking_1.adminview" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Admin View Page</title>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Button ID="btnShowMembers" runat="server" Text="Show Members" OnClick="btnShowMembers_Click" />

        <asp:Button ID="btnShowAdminCount" runat="server" Text="Show Admin Count" OnClick="btnShowAdminCount_Click" />

        <asp:Panel ID="adminCountBox" runat="server" Visible="false"
            style="margin-top: 20px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f9f9f9; width: 200px;">
            <asp:Label ID="lblAdminCount" runat="server" Text="" Font-Bold="true" Font-Size="Medium" ForeColor="Black">
            </asp:Label>
        </asp:Panel>

        <asp:Button ID="btnShowLowStock" runat="server" Text="Show Products with Stock Below 50"
            OnClick="btnShowLowStock_Click" />

        <asp:Button ID="btnShowTopSelling" runat="server" Text="Show Top Selling Products"
            OnClick="btnShowTopSelling_Click" />

        <asp:GridView ID="GridViewLowStock" runat="server" AutoGenerateColumns="False" Visible="false">
            <Columns>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="current_stock" HeaderText="Stock Quantity" />
            </Columns>
        </asp:GridView>

        <asp:GridView ID="GridViewTopSelling" runat="server" AutoGenerateColumns="False" Visible="false">
            <Columns>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="actual_stock" HeaderText="Initial Stock" />
                <asp:BoundField DataField="current_stock" HeaderText="Current Stock" />
                <asp:BoundField DataField="stock_difference" HeaderText="Stock Difference" />
            </Columns>
        </asp:GridView>

        <asp:GridView ID="GridViewMembers" runat="server" AutoGenerateColumns="False" Visible="false">
            <Columns>
                <asp:BoundField DataField="member_id" HeaderText="Member ID" />
                <asp:BoundField DataField="full_name" HeaderText="Full Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="contact_no" HeaderText="Contact Number" />
                <asp:BoundField DataField="day_of_birthday" HeaderText="Birthday" />
                <asp:BoundField DataField="state" HeaderText="State" />
                <asp:BoundField DataField="city" HeaderText="City" />
                <asp:BoundField DataField="pincode" HeaderText="Postal Code" />
                <asp:BoundField DataField="full_address" HeaderText="Address" />
                <asp:BoundField DataField="account_status" HeaderText="Account Status" />
            </Columns>
        </asp:GridView>
    </asp:Content>