<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="menus.aspx.cs" Inherits="CafeTracking_1.menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btn {
            border: none;
            background-color:  #895129 ;
            color: white;
            padding: 2px 13px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btnekle {
            border: none;
            background-color:  #e4c0a8 ; 
            color: black;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
        }
        .btn:hover {
            background-color: #0056b3; 
        }

       
        body {
            background-image: url('imgs/kafe3.png'); 
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            padding: 20px;
        }

       
        .menu-section {
            background: rgba(255, 255, 255, 0.85);
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            max-height: 400px; 
            overflow-y: auto; 
        }

        .menu-title {
            text-align: center;
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 10px;
        }

      
        .menu-img {
            width: 200px;
            height: 150px;
            object-fit: cover; 
            transition: transform 0.3s ease-in-out;
            border-radius: 10px;
        }

        .menu-img:hover {
            transform: scale(1.1);
        }

        
        @media (max-width: 576px) {
            .menu-img {
                width: 100%;
                height: auto;
            }
        }

        .menu-item {
            flex: 0 0 calc(25% - 10px); 
            margin: 5px; 
        }

        .row {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto; 
            justify-content: flex-start;
        }
        .tall {
            object-position: center top; 
        }

    </style>
    <script>
        
        document.addEventListener("DOMContentLoaded", function () {
            const quantities = JSON.parse(localStorage.getItem('quantities')) || {};

           
            document.querySelectorAll('.menu-item').forEach(item => {
                const itemName = item.querySelector('p').textContent; 
                const quantitySpan = item.querySelector('.quantity');

                
                if (quantities[itemName]) {
                    quantitySpan.textContent = quantities[itemName];
                } else {
                    quantitySpan.textContent = 0; 
                }
            });
        });

        function updateQuantity(button, operation) {
            var quantitySpan = button.parentElement.querySelector('.quantity');
            var itemName = button.parentElement.querySelector('p').textContent; 
            var currentQuantity = parseInt(quantitySpan.textContent);

            if (operation === '+') {
                currentQuantity++;
            } else if (operation === '-' && currentQuantity > 0) {
                currentQuantity--;
            }

            quantitySpan.textContent = currentQuantity;


            const quantities = JSON.parse(localStorage.getItem('quantities')) || {};
            quantities[itemName] = currentQuantity;
            localStorage.setItem('quantities', JSON.stringify(quantities));
        }

        function addToCard() {
            const quantities = JSON.parse(localStorage.getItem('quantities')) || {};
            const seat = JSON.parse(localStorage.getItem('selectedSeats')) || [];
            const selectedProducts = [];
            const seatNumber = seat[seat.length - 1];
        
            for (const product in quantities) {
                if (quantities[product] > 0) {
                    selectedProducts.push({ name: product, quantity: quantities[product], seat: seatNumber });
                }
            }

         
            const existingProducts = JSON.parse(localStorage.getItem('selectedProducts')) || [];

        
            selectedProducts.forEach(selectedProduct => {
                const existingProductIndex = existingProducts.findIndex(product => product.name === selectedProduct.name && product.seat === selectedProduct.seat);
                if (existingProductIndex > -1) {
                    existingProducts[existingProductIndex].quantity += selectedProduct.quantity;
                } else {
                    existingProducts.push(selectedProduct);
                }
            });

         
            localStorage.setItem('selectedProducts', JSON.stringify(existingProducts));
            window.location.href = 'cardadmin.aspx';
        }
        function updatePrice(productName, productPrice) {
            const menuItems = document.querySelectorAll('.menu-item');
            menuItems.forEach(item => {
                const itemName = item.querySelector('p').textContent;
                if (itemName === productName) {
                    const priceElement = item.querySelector('.price');
                    priceElement.textContent = `$${productPrice}`; 
                }
            });
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- Hot Drinks Section -->
        <div class="menu-section">
            <h3 class="menu-title">Hot Drinks</h3>
            <div class="row">
                <div class="text-center menu-item">
                    <img src="imgs/hot_drink.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Espresso</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/hot_drink2.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Cappuccino</p>
                    <p class="price">$6.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/hot_drink3.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Latte</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/hot_drink4.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Tea</p>
                    <p class="price">$1.70</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/turkishcoffee.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Turkish Coffee</p>
                    <p class="price">$4.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/hot_chocalate.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Hot Chocolate</p>
                    <p class="price">$2.50</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/toffe_nut.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Toffee Nut Coffee</p>
                    <p class="price">$3.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/americano.jpg" alt="Hot Drink" class="menu-img" />
                    <p>Americano</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
            </div>
        </div>

        <!-- Cold Drinks Section -->
        <div class="menu-section">
            <h3 class="menu-title">Cold Drinks</h3>
            <div class="row">
                <div class="text-center menu-item">
                    <img src="imgs/cold_drink.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Iced Coffee</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/cold_drink2.jpg" alt="Cold Drink" class="menu-img tall" />
                    <p>Lemonade</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/cold_drink3.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Cola</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/cold_drink4.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Fruit Juice</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/sprite.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Sprite</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/fanta.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Fanta</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/water.jpg" alt="Cold Drink" class="menu-img" />
                    <p>Water</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>

            </div>
        </div>

        <!-- Milkshakes Section -->
        <div class="menu-section">
            <h3 class="menu-title">Milkshakes</h3>
            <div class="row">
                <div class="text-center menu-item">
                    <img src="imgs/milkshake.jpg" alt="Milkshake" class="menu-img" />
                    <p>Chocolate Milkshake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/milkshake2.jpg" alt="Milkshake" class="menu-img" />
                    <p>Vanilla Milkshake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/milkshake3.jpg" alt="Milkshake" class="menu-img tall" />
                    <p>Strawberry Milkshake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/milkshake4.jpg" alt="Milkshake" class="menu-img" />
                    <p>Banana Milkshake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/milkshakeormanmeyve.jpg" alt="Milkshake" class="menu-img" />
                    <p>Forest Berry Milkshake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
            </div>
        </div>

        <!-- Desserts Section -->
        <div class="menu-section">
            <h3 class="menu-title">Desserts</h3>
            <div class="row">
                <div class="text-center menu-item">
                    <img src="imgs/dessert1.jpg" alt="Dessert" class="menu-img" />
                    <p>Chocolate Cake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/dessert2.jpg" alt="Dessert" class="menu-img" />
                    <p>Cheesecake</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/dessert3.jpg" alt="Dessert" class="menu-img" />
                    <p>Ice Cream</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
                <div class="text-center menu-item">
                    <img src="imgs/dessert4.jpg" alt="Dessert" class="menu-img" />
                    <p>Tiramisu</p>
                    <p class="price">$2.00</p>
                    <button class="btn" onclick="updateQuantity(this, '-')">-</button>
                    <span class="quantity">0</span>
                    <button class="btn" onclick="updateQuantity(this, '+')">+</button>
                </div>
            </div>
            <div style="text-align: center; margin-top: 20px;">
                <button class="btnekle" onclick="addToCard()">Add</button>
            </div>
        </div>
        
    </div>
    
    

</asp:Content>
