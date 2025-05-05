<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adminlogout.aspx.cs"
    Inherits="CafeTracking_1.adminlogout" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .logout-container {
                text-align: center;
                margin-top: 50px;
                margin-bottom: 50px;
            }

            .btn-logout {
                padding: 10px 20px;
                font-size: 16px;
                background-color: red;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .logout-message {
                font-style: italic;
            }

            .delete-account-section {
                display: none;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="logout-container">
            <h2 class="logout-message">Are You Sure You Want to Logout?</h2>

            <asp:Button ID="ButtonLogout" runat="server" Text="Logout" CssClass="btn-logout"
                OnClick="ButtonLogout_Click" />

            <br /><br />

            <asp:Button ID="ButtonDeleteAccount" runat="server" Text="Delete Account" CssClass="btn-logout"
                OnClick="ButtonDeleteAccount_Click" />

            <div class="delete-account-section" id="deleteAccountsection" runat="server">
                <h2 class="logout-message">Please Confirm to Delete Your Account</h2>
                <label for="adminId">Admin ID:</label>
                <asp:TextBox ID="adminid" runat="server" />
                <br />
                <label for="adminPassword">Password:</label>
                <asp:TextBox ID="adminpassword" runat="server" TextMode="Password" />
                <br />
                <asp:Button ID="ButtonDeleteAccountConfirm" runat="server" Text="Confirm Delete" CssClass="btn-logout"
                    OnClick="ButtonDeleteAccountConfirm_Click" />
            </div>
        </div>
    </asp:Content>