﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs"
    Inherits="CafeTracking_1.adminlogin" %>
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
                                        <img width="75px" height="75px" src="imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3> Member Login </h3>
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
                                    <label> Member ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"
                                            placeholder="Member ID"></asp:TextBox>
                                    </div>
                                    <label> Password </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server"
                                            Text="Login" OnClick="Button1_Click" />
                                    </div>
                                    <div class="form-group">

                                        <a href="usersignup.aspx"><input class="btn btn-info btn-block btn-lg"
                                                id="Button2" type="button" value="Sign Up" /> </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <a href="homepage.aspx">
                        << Back to Home</a><br>
                            <div class="form-group">
                                <a href="adminlogin.aspx">
                                    <input class="btn btn-warning btn-block btn-lg" id="Button3" type="button"
                                        value="Admin Login" />
                                </a>
                            </div>
                </div>
            </div>
        </div>


    </asp:Content>