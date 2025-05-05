<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="card.aspx.cs" Inherits="CafeTracking_1.card" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-item {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            background: white;
        }
        .total {
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 20px;
        }
        .btn {
            margin-top: 20px;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }
        .pay-button {
            margin-left: 30px;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 8px;
            width: 400px;
        }
        .modal-header {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .modal-close {
            float: right;
            cursor: pointer;
            color: red;
            font-size: 20px;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Selected Products</h2>
        <div id="cardItems"></div>
    </div>

   
    <div class="overlay" id="paymentOverlay"></div>
    <div class="modal" id="paymentModal">
        <div class="modal-header">
            Payment Details
            <span class="modal-close" id="modalClose">&times;</span>
        </div>
        <div>
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" class="form-control" placeholder="Enter card number" maxlength="16" />
        </div>
        <div>
            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" class="form-control" placeholder="MM/YY" />
        </div>
        <div>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" class="form-control" placeholder="CVV" maxlength="3" />
        </div>
        <button class="btn" id="payButton">Pay</button>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let selectedProducts = JSON.parse(localStorage.getItem('selectedProducts')) || [];
            const cardItemsDiv = document.getElementById('cardItems');
            const paymentModal = document.getElementById('paymentModal');
            const paymentOverlay = document.getElementById('paymentOverlay');
            const modalClose = document.getElementById('modalClose');
            const payButton = document.getElementById('payButton');

            let selectedProductForPayment = null;

           
            if (selectedProducts.length === 0) {
                cardItemsDiv.innerHTML = 'No products selected.';
                return;
            }

           
            selectedProducts.forEach(product => {
                const productDiv = document.createElement('div');
                productDiv.className = 'card-item';
                const productPrice = product.quantity * 2.00;
                productDiv.innerHTML = `${product.name} - Quantity: ${product.quantity} - Price: $${productPrice.toFixed(2)}`;

               
                const payButton = document.createElement('button');
                payButton.textContent = 'Payment';
                payButton.className = 'btn pay-button';
                payButton.onclick = function (event) {
                    event.preventDefault();
                    selectedProductForPayment = product;
                    openPaymentModal();
                };

                productDiv.appendChild(payButton);
                cardItemsDiv.appendChild(productDiv);
            });

           
            function openPaymentModal() {
                paymentModal.style.display = 'block';
                paymentOverlay.style.display = 'block';
            }

           
            function closePaymentModal() {
                paymentModal.style.display = 'none';
                paymentOverlay.style.display = 'none';
            }

            modalClose.addEventListener('click', closePaymentModal);
            paymentOverlay.addEventListener('click', closePaymentModal);

            
            payButton.addEventListener('click', function (event) {
                event.preventDefault(); 

                const cardNumber = document.getElementById('cardNumber').value;
                const expiryDate = document.getElementById('expiryDate').value;
                const cvv = document.getElementById('cvv').value;

                if (!cardNumber || !expiryDate || !cvv) {
                    alert("Please fill in all the card details.");
                    return;
                }

               
                alert("Payment processed successfully!");

              
                if (selectedProductForPayment) {
                    fetch("card.aspx/UpdateProductStock", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify({
                            productName: selectedProductForPayment.name,
                            quantity: selectedProductForPayment.quantity,
                        }),
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.d.includes("successfully")) {
                                alert("Stock updated successfully!");
                                removeProductFromStorage(selectedProductForPayment.name);
                                cardItemsDiv.innerHTML = "";
                            } else {
                                alert("Error: " + data.d);
                            }
                        })
                        .catch(err => alert("Error: " + err.message));
                }

                closePaymentModal();
            });

            function removeProductFromStorage(productName) {
                selectedProducts = selectedProducts.filter(product => product.name !== productName);
                localStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));
            }
        });
    </script>
</asp:Content>
