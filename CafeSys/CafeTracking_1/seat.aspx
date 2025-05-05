<%@ Page Title="Seat Selection" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="seat.aspx.cs" Inherits="CafeTracking_1.seat" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .form-group {
                position: fixed;
                bottom: 50px;
                right: 15px;
                width: 120px;
            }

            #Adminshowmenusbuttton {
                width: 100%;
                height: 40px;
                font-size: 14px;
                border-radius: 20px;
                border: none;
            }

            .table {
                display: inline-block;
                width: 100px;
                height: 100px;
                margin: 30px;
                border-radius: 50%;
                text-align: center;
                line-height: 100px;
                font-size: 20px;
                cursor: pointer;
                position: relative;
                background-color: #8B4513;
                color: white;
                transition: background-color 0.3s;
            }

            .table:hover {
                background-color: #A0522D;
            }

            .occupied {
                background-color: red;
            }

            .table-number {
                position: absolute;
                bottom: 10px;
                left: 50%;
                transform: translateX(-50%);
                font-size: 16px;
            }

            .status {
                position: absolute;
                top: 10px;
                left: 50%;
                transform: translateX(-50%);
                font-size: 14px;
            }

            body {
                background-image: url('imgs/kafe3.png');
                background-size: cover;
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.7);
            }

            .transparent-container {
                background-color: rgba(255, 255, 255, 0.5);
                padding: 20px;
                border-radius: 15px;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="transparent-container">
            <h2>Select Your Seat</h2>
            <div id="seats">
                <% for (int i=1; i <=20; i++) { %>
                    <div class="table empty" id="seat-<%= i %>" onclick="selectSeat('<%= i %>')">
                        <div class="status">Empty</div>
                        <div class="table-number">
                            <%= i %>
                        </div>
                    </div>
                    <% } %>
            </div>
            <div class="form-group">
                <a href="menusadmin.aspx" onclick="goToMenuPage()">
                    <input class="btn btn-info btn-block btn-lg" id="Adminshowmenusbuttton" type="button"
                        value="next" />
                </a>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const seatStatus = JSON.parse(localStorage.getItem('seatStatus')) || {};

                for (let i = 1; i <= 20; i++) {
                    const seat = document.getElementById('seat-' + i);
                    if (seatStatus['seat-' + i] === 'occupied') {
                        seat.classList.remove('empty');
                        seat.classList.add('occupied');
                        seat.querySelector('.status').innerText = 'Occupied';
                    } else {
                        seat.classList.add('empty');
                        seat.classList.remove('occupied');
                        seat.querySelector('.status').innerText = 'Empty';
                    }
                }
            });

            function selectSeat(seatNumber) {
                const seat = document.getElementById('seat-' + seatNumber);
                if (seat) {
                    if (seat.classList.contains('empty')) {
                        seat.classList.remove('empty');
                        seat.classList.add('occupied');
                        seat.querySelector('.status').innerText = 'Occupied';
                    } else {
                        seat.classList.remove('occupied');
                        seat.classList.add('empty');
                        seat.querySelector('.status').innerText = 'Empty';
                    }
                    const seatStatus = JSON.parse(localStorage.getItem('seatStatus')) || {};
                    seatStatus['seat-' + seatNumber] = seat.classList.contains('occupied') ? 'occupied' : 'empty';
                    localStorage.setItem('seatStatus', JSON.stringify(seatStatus));
                }
            }

            function goToMenuPage() {
                const selectedSeats = [];
                const seatStatus = JSON.parse(localStorage.getItem('seatStatus')) || {};
                for (let i = 1; i <= 20; i++) {
                    if (seatStatus['seat-' + i] === 'occupied') {
                        selectedSeats.push(i);
                    }
                }

                if (selectedSeats.length > 0) {
                    localStorage.setItem('selectedSeats', JSON.stringify(selectedSeats));
                } else {
                    alert('No seats selected.');
                }
            }
        </script>
    </asp:Content>