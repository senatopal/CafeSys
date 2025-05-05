<%@ Page Title="Update Password" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true"
    CodeBehind="updatepassword.aspx.cs" Inherits="CafeTracking_1.updatepassword" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .update-password-container {
                width: 400px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #f9f9f9;
                text-align: center;
            }

            .update-password-container h2 {
                margin-bottom: 20px;
            }

            .update-password-container label {
                display: block;
                margin: 10px 0 5px;
                font-weight: bold;
            }

            .update-password-container input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .btn-update-password {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-update-password:hover {
                background-color: #45a049;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="update-password-container">
            <h2>Update Password</h2>

            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>

            <label for="txtPreviousPassword">Previous Password:</label>
            <asp:TextBox ID="txtPreviousPassword" runat="server" TextMode="Password"
                placeholder="Enter your previous password"></asp:TextBox>

            <label for="txtNewPassword">New Password:</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Enter your new password">
            </asp:TextBox>

            <asp:Button ID="btnUpdatePassword" runat="server" CssClass="btn-update-password" Text="Update Password"
                OnClick="btnUpdatePassword_Click" />
        </div>
    </asp:Content>