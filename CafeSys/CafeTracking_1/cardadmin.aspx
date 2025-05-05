<%@ Page Title="Card Admin" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cardadmin.aspx.cs" Inherits="CafeTracking_1.cardadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-item {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            background: white;
        }
        .product-item {
            margin-bottom: 5px;
        }
        .total {
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 20px;
        }
        .btn {
            margin-top: 5px;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Selected Tables and Products</h2>
        <div id="cardItems"></div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let selectedSeats = JSON.parse(localStorage.getItem('selectedSeats')) || [];
            let selectedProducts = JSON.parse(localStorage.getItem('selectedProducts')) || [];
            const cardItemsDiv = document.getElementById('cardItems');

            if (selectedSeats.length === 0 || selectedProducts.length === 0) {
                cardItemsDiv.innerHTML = 'No products selected for any table.';
                return;
            }

            let grandTotal = 0;

            selectedSeats.forEach(seat => {
                const seatInfo = document.createElement('div');
                seatInfo.className = 'card-item';
                let content = `<strong>TABLE ${seat}:</strong><br>`;
                let seatTotal = 0;

                const seatProducts = selectedProducts.filter(product => product.seat === seat);

                if (seatProducts.length === 0) {
                    content += `No products selected for this table.<br>`;
                } else {
                    seatProducts.forEach((product, index) => {
                        const productPrice = product.quantity * 2.00;
                        content += `<div class="product-item" id="product_${seat}_${index}">
                            ${product.name} - Quantity: <span id="quantity_${seat}_${index}">${product.quantity}</span> - Price: $${(product.quantity * 2.00).toFixed(2)}
                            <button class="btn" id="payBtn_${seat}_${index}">Pay 1</button>
                        </div>`;
                        seatTotal += productPrice;
                        grandTotal += productPrice;
                    });
                }

                content += `<strong>Total for Table ${seat}: $${seatTotal.toFixed(2)}</strong><br>`;
                seatInfo.innerHTML = content;
                cardItemsDiv.appendChild(seatInfo);

                seatProducts.forEach((product, index) => {
                    const payButton = document.getElementById(`payBtn_${seat}_${index}`);
                    payButton.onclick = function () {
                        handlePayedClick(product, payButton, seat, index);
                    };
                });
            });

            function handlePayedClick(product, button, seat, index) {
                console.log(`Processing payment for: ${product.name}, Quantity: 1`);

                
                product.quantity -= 1;
                const quantitySpan = document.getElementById(`quantity_${seat}_${index}`);
                quantitySpan.textContent = product.quantity;

               
                const productDiv = document.getElementById(`product_${seat}_${index}`);
                if (product.quantity === 0) {
                    productDiv.remove();
                    selectedProducts = selectedProducts.filter(
                        p => !(p.seat === seat && p.name === product.name)
                    );
                }

                localStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));
                updateProductStock(product.name, 1);
                updateGrandTotal();
            }

            function updateGrandTotal() {
                grandTotal = selectedProducts.reduce((total, product) => {
                    return total + product.quantity * 2.00;
                }, 0);

                const totalDiv = document.querySelector('.total');
                if (totalDiv) {
                    totalDiv.innerHTML = `Grand Total: $${grandTotal.toFixed(2)}`;
                } else if (grandTotal > 0) {
                    const newTotalDiv = document.createElement('div');
                    newTotalDiv.className = 'total';
                    newTotalDiv.innerHTML = `Grand Total: $${grandTotal.toFixed(2)}`;
                    cardItemsDiv.appendChild(newTotalDiv);
                }

                if (grandTotal === 0) {
                    cardItemsDiv.innerHTML = 'No products selected for any table.';
                }
            }

            function updateProductStock(productName, quantity) {
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'cardadmin.aspx/UpdateProductStock', true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        console.log("Stock updated successfully.");
                    }
                };
                const data = JSON.stringify({ productName: productName, quantity: quantity });
                xhr.send(data);
            }
        });
    </script>
</asp:Content>
