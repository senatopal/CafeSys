<%@ Page Title="Product Arrangement" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="productarrangement.aspx.cs" Inherits="CafeTracking_1.productarrangement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Product Management</h2>
        <div class="form-group">
            <asp:TextBox ID="txtProductId" runat="server" placeholder="Product ID" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtProductName" runat="server" placeholder="Product Name" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtProductPrice" runat="server" placeholder="Product Price" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtActualStock" runat="server" placeholder="Actual Stock" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtCurrentStock" runat="server" placeholder="Current Stock" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Product" CssClass="btn" OnClick="btnUpdate_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </div>
</asp:Content>