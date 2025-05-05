<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="CafeTracking_1.adminlogin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Button3 {
        font-size: 14px; 
        padding: 5px 10px; 
        width: auto; 
        height: auto; 
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3> Admin Login </h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label> Admin Full-Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Admini" runat="server" placeholder="Full-Name"></asp:TextBox>
                                </div>
                                <label> Password </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="AdminP" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-info btn-block btn-lg" ID="ButtonLogin" runat="server" Text="Login" OnClick="Button_Click" />
                                </div>
                            </div>
                        </div>
                        <a href="userlogin.aspx"> << Back to Member Login</a><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>