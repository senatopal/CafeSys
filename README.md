# CafeTracking Project

## Overview
The **CafeTracking** project is a database-driven web application designed to manage cafe operations efficiently. It provides separate functionality for **administrators** and **members**, supporting user login, menu selection, payment processing, and product management.

> 💡 The database connection string is defined in `web.config`.

---

## Features

### General
- **Homepage**: Executing `Homepage.aspx` opens the landing page of the application.
- **Login**: Supports both **admin** and **member** authentication.

---

### Member Functionality
1. **Member Login**  
   - Successful login redirects to `CustomerHomepage.aspx`.
   - Login section is hidden.
   - "Update Password" option becomes visible.

2. **Update Password**  
   - Requires:
     - Full Name  
     - Previous Password  
     - New Password  
   - Updates the password in the database.

3. **Menu Selection**  
   - Users can select menu items and add them to the basket.

4. **Basket & Payment**  
   - Displays selected items and prices.
   - Users can enter card details to pay via the **Pay** button.

5. **Logout Options**
   - **Delete Account**: Deletes the user account and triggers database operations.
   - **Logout**: Logs the user out of the session.

---

### Admin Functionality
1. **Admin Login**
   - Grants access to extended controls such as:
     - Seat Management  
     - Product Arrangement  
     - Database Views

2. **Seat Management**
   - Assign customers to tables and mark them as “Occupied”.
   - Order items from the menu and add them to the customer’s basket.
   - Process payments per item using the **Pay** button.

3. **Product Arrangement**
   - Update product details (e.g., price, stock).

4. **View Section**
   - Predefined admin reports:
     - Show Members  
     - Show Admin Count  
     - Show Products with Stock Below 50  
     - Show Top-Selling Products

---

## Database Details

### Tables
- `admin_LogTbl` – Admin activity logs  
- `admin_Tbl` – Admin account details  
  - Trigger: `trg_AfterDelete_Admin`  
- `card_Tbl` – Card details for transactions  
- `contact_Tbl` – Feedback and suggestions  
- `memberSignup_LogTbl` – Member signup logs  
- `memberSignup_Tbl` – Member accounts  
  - Triggers:  
    - `trg_AfterDelete_MemberSignup`  
    - `trg_AfterPasswordUpdate`  
- `password_LogTbl` – Password change logs  
- `product_Tbl` – Product listings

### Views
- `vw_member` – Member analytics and reporting

### Functions
- `GetLowStockProducts()`  
- `GetTopSellingProducts()`  
- `GetAdminsCount()`

### Stored Procedures
- `AddNewMember`  
- `CheckAdminLogin`  
- `CheckUser`  
- `GetCustomerReviews`  
- `SaveCardInfo`

### Triggers
- `trg_AfterDelete_Admin`  
- `trg_AfterDelete_MemberSignup`  
- `trg_AfterPasswordUpdate`

---

## Running the Project

1. Open the solution in Visual Studio or your preferred IDE.
2. Run `Homepage.aspx` to start the application.
3. Log in as a **member** or **admin** using the login page.
4. Navigate the features based on your access level.


