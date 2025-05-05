<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs"
    Inherits="CafeTracking_1.usersignup" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 mx-auto">
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
                                        <h4> Member Sign Up </h4>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label> Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"
                                            placeholder="Full Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label> Date of Birth </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"
                                            placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label> Contact Number </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"
                                            placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label> Email ID </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"
                                            placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label> Password </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label> State </label>
                                    <div class="form-group">
                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="Select" Value="select" />
                                            <asp:ListItem Text="Adana" Value="Adana" />
                                            <asp:ListItem Text="Adıyaman" Value="Adıyaman" />
                                            <asp:ListItem Text="Afyonkarahisar" Value="Afyonkarahisar" />
                                            <asp:ListItem Text="Ağrı" Value="Ağrı" />
                                            <asp:ListItem Text="Aksaray" Value="Aksaray" />
                                            <asp:ListItem Text="Amasya" Value="Amasya" />
                                            <asp:ListItem Text="Ankara" Value="Ankara" />
                                            <asp:ListItem Text="Antalya" Value="Antalya" />
                                            <asp:ListItem Text="Artvin" Value="Artvin" />
                                            <asp:ListItem Text="Aydın" Value="Aydın" />
                                            <asp:ListItem Text="Balıkesir" Value="Balıkesir" />
                                            <asp:ListItem Text="Bilecik" Value="Bilecik" />
                                            <asp:ListItem Text="Bingöl" Value="Bingöl" />
                                            <asp:ListItem Text="Bitlis" Value="Bitlis" />
                                            <asp:ListItem Text="Bolu" Value="Bolu" />
                                            <asp:ListItem Text="Burdur" Value="Burdur" />
                                            <asp:ListItem Text="Bursa" Value="Bursa" />
                                            <asp:ListItem Text="Çanakkale" Value="Çanakkale" />
                                            <asp:ListItem Text="Çankırı" Value="Çankırı" />
                                            <asp:ListItem Text="Denizli" Value="Denizli" />
                                            <asp:ListItem Text="Diyarbakır" Value="Diyarbakır" />
                                            <asp:ListItem Text="Edirne" Value="Edirne" />
                                            <asp:ListItem Text="Elazığ" Value="Elazığ" />
                                            <asp:ListItem Text="Erzincan" Value="Erzincan" />
                                            <asp:ListItem Text="Erzurum" Value="Erzurum" />
                                            <asp:ListItem Text="Eskişehir" Value="Eskişehir" />
                                            <asp:ListItem Text="Gaziantep" Value="Gaziantep" />
                                            <asp:ListItem Text="Giresun" Value="Giresun" />
                                            <asp:ListItem Text="Gümüşhane" Value="Gümüşhane" />
                                            <asp:ListItem Text="Hakkari" Value="Hakkari" />
                                            <asp:ListItem Text="Hatay" Value="Hatay" />
                                            <asp:ListItem Text="Iğdır" Value="Iğdır" />
                                            <asp:ListItem Text="Isparta" Value="Isparta" />
                                            <asp:ListItem Text="İstanbul" Value="İstanbul" />
                                            <asp:ListItem Text="İzmir" Value="İzmir" />
                                            <asp:ListItem Text="Kahramanmaraş" Value="Kahramanmaraş" />
                                            <asp:ListItem Text="Karabük" Value="Karabük" />
                                            <asp:ListItem Text="Karaman" Value="Karaman" />
                                            <asp:ListItem Text="Kars" Value="Kars" />
                                            <asp:ListItem Text="Kastamonu" Value="Kastamonu" />
                                            <asp:ListItem Text="Kayseri" Value="Kayseri" />
                                            <asp:ListItem Text="Kırıkkale" Value="Kırıkkale" />
                                            <asp:ListItem Text="Kırklareli" Value="Kırklareli" />
                                            <asp:ListItem Text="Kırşehir" Value="Kırşehir" />
                                            <asp:ListItem Text="Kocaeli" Value="Kocaeli" />
                                            <asp:ListItem Text="Konya" Value="Konya" />
                                            <asp:ListItem Text="Kütahya" Value="Kütahya" />
                                            <asp:ListItem Text="Malatya" Value="Malatya" />
                                            <asp:ListItem Text="Manisa" Value="Manisa" />
                                            <asp:ListItem Text="Mardin" Value="Mardin" />
                                            <asp:ListItem Text="Muğla" Value="Muğla" />
                                            <asp:ListItem Text="Muş" Value="Muş" />
                                            <asp:ListItem Text="Nevşehir" Value="Nevşehir" />
                                            <asp:ListItem Text="Niğde" Value="Niğde" />
                                            <asp:ListItem Text="Ordu" Value="Ordu" />
                                            <asp:ListItem Text="Osmaniye" Value="Osmaniye" />
                                            <asp:ListItem Text="Rize" Value="Rize" />
                                            <asp:ListItem Text="Sakarya" Value="Sakarya" />
                                            <asp:ListItem Text="Samsun" Value="Samsun" />
                                            <asp:ListItem Text="Siirt" Value="Siirt" />
                                            <asp:ListItem Text="Sinop" Value="Sinop" />
                                            <asp:ListItem Text="Sivas" Value="Sivas" />
                                            <asp:ListItem Text="Tekirdağ" Value="Tekirdağ" />
                                            <asp:ListItem Text="Tokat" Value="Tokat" />
                                            <asp:ListItem Text="Trabzon" Value="Trabzon" />
                                            <asp:ListItem Text="Tunceli" Value="Tunceli" />
                                            <asp:ListItem Text="Şanlıurfa" Value="Şanlıurfa" />
                                            <asp:ListItem Text="Uşak" Value="Uşak" />
                                            <asp:ListItem Text="Van" Value="Van" />
                                            <asp:ListItem Text="Yalova" Value="Yalova" />
                                            <asp:ListItem Text="Yozgat" Value="Yozgat" />
                                            <asp:ListItem Text="Zonguldak" Value="Zonguldak" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label> City </label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server"
                                            placeholder="City"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label> Pincode </label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server"
                                            placeholder="Pincode" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label> Full Address </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server"
                                            placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button CssClass="btn btn-info btn-block btn-lg" ID="Button2" runat="server"
                                            Text="Sign Up" OnClick="Button2_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <a href="homepage.aspx">
                        << Back to Home</a><br>
                </div>
            </div>
        </div>
    </asp:Content>