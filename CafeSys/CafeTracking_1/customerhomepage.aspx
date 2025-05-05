<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="customerhomepage.aspx.cs" Inherits="CafeTracking_1.customerhomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="styles/homepage.css" /> 
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-image: url('imgs/kafe3.png'); 
            background-size: cover; 
            background-repeat: no-repeat; 
            background-attachment: fixed; 
            background-position: center;
            color: #333; 
        }

        section, footer {
            background-color: rgba(255, 255, 255, 0.85); 
            border-radius: 8px;
            padding: 20px;
            margin: 10px 0;
        }

        #full-page-image img {
            width: 100%;
            height: auto;
        }

        .card, .offer-card, .review-card {
            background-color: rgba(255, 255, 255, 0.9); 
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card:hover, .offer-card:hover, .review-card:hover {
            transform: scale(1.05);
        }

        .container {
            margin-top: 20px;
        }

        h2, h3, h4 {
            color: #6f42c1;
        }

        .btn-primary {
            background-color: #6f42c1;
            border: none;
        }

        .btn-primary:hover {
            background-color: #5a32a1;
        }

        footer {
            background-color: rgba(52, 58, 64, 0.9);
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .offer-card {
            background-color: rgba(233, 236, 239, 0.9);
            border-left: 5px solid #6f42c1;
        }

        .review-card {
            background-color: rgba(241, 241, 241, 0.9);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="full-page-image">
        <img src="imgs/kafe3.png" alt="kafe gorseli" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2 style="color: black;">Sena's Coffee House</h2>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <center>
                        <img width="150px" src="imgs/coffee3.png" />
                        <h4 style="color: black;">New Arrivals</h4>
                        <p>Toffee Nut Latte, Dubai Chocolate, Peanut Coffee</p>
                    </center>
                </div>
                <div class="col-md-6">
                    <center>
                        <img width="350px" src="imgs/Happy.jpg" />
                        <h4 style="color: black;">Your Choices</h4>
                        <p>White Chocolate Mocha, Latte, Cappuccino</p>
                    </center>
                </div>
            </div>

            <div class="row "
            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <img src="imgs/hot_drink3.jpg" class="card-img-top" alt="Espresso" style="height: 200px; object-fit: cover;" />
                        <div class="card-body">
                            <h5 class="card-title">Espresso</h5>
                            <p class="card-text">Rich and bold espresso made from the finest beans.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="imgs/hot_drink2.jpg" class="card-img-top" alt="Cappuccino" />
                        <div class="card-body">
                            <h5 class="card-title">Cappuccino</h5>
                            <p class="card-text">A perfect blend of espresso, steamed milk, and foam.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="imgs/hot_drink4.jpg" class="card-img-top" alt="Tea" />
                        <div class="card-body">
                            <h5 class="card-title">Tea</h5>
                            <p class="card-text">Enjoy these teas made with unique herbs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-12">
                    <h3>Special Offers</h3>
                    <p>Check out our special offers for the month!</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="offer-card">
                        <h4>Buy 1 Get 1 Free</h4>
                        <p>On all lattes every Friday!</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="offer-card">
                        <h4>20% Off</h4>
                        <p>On all pastries with any drink purchase.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="offer-card">
                        <h4>Happy Hour</h4>
                        <p>Every day from 4 PM to 6 PM, enjoy 50% off on selected drinks!</p>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-12">
                    <h3>Customer Reviews</h3>
                    <p>What our customers say about us:</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="review-card">
                        <h5>John Doe</h5>
                        <p>"Best coffee in town! The ambiance is perfect for studying."</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <h5>Jane Smith</h5>
                        <p>"I love the new arrivals! The Toffee Nut Latte is my favorite."</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <h5>Emily Johnson</h5>
                        <p>"Great place to relax and enjoy a cup of coffee with friends."</p>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-12">
                    <h3>Contact Us</h3>
                    <p>If you have any questions or feedback, feel free to reach out!</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name" required="true"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mt-2" placeholder="Your Email" required="true"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mt-2" placeholder="Your Message" required="true"></asp:TextBox>
                    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn btn-primary mt-2" OnClick="btnSendMessage_Click" />
                </div>
                <div class="col-md-6">
                    <h4>Our Location</h4>
                    <p>123 Coffee Lane, Brewtown, CA 12345</p>
                    <h4>Follow Us</h4>
                    <p>
                        <a href="#">Facebook</a> | 
                        <a href="#">Instagram</a> | 
                        <a href="#">Twitter</a>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2023 Sena's Coffee House. All rights reserved.</p>
        </div>
    </footer>
</asp:Content>