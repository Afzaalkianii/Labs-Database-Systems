# Point of Sale (POS) Database — Lab 02

## Overview

This project is a **Point of Sale (POS) Database** created in MySQL. It manages users, roles and permissions, products, inventory changes, discounts, orders, and order items.

The database also contains reporting queries for viewing product information, orders, sales, customer spending, product performance, promotions, and inventory activity.

## Database Name

`Point_of_Sale`

## Main Features

- Role-Based Access Control (RBAC)
- User and permission management
- Product and category management
- Inventory tracking
- Discount and promotion management
- Order and billing management
- Order item details
- Sales and business reporting queries

## Database Tables

### 1. `roles`
Stores the different user roles in the system.

Example roles:
- Admin
- Salesman
- Customer

### 2. `permissions`
Stores actions that users can perform, such as:
- View products
- Add product
- Edit product
- Delete product
- View orders
- Create order
- Apply discount
- Manage users
- View reports
- Manage inventory

### 3. `role_permissions`
Connects roles with their assigned permissions.

### 4. `users`
Stores system users along with their role, username, password, and deletion status.

### 5. `categories`
Stores product categories such as Electronics, Clothing, Groceries, Beverages, and others.

### 6. `products`
Stores product information including category, product name, price, and deletion status.

### 7. `inventory_logs`
Records inventory changes, including the product, user, quantity change, reason, and timestamp.

### 8. `discount_rules`
Stores promotional discounts, their percentage, validity date, and active status.

### 9. `orders`
Stores customer orders, applied discounts, total amount, and order creation time.

### 10. `order_items`
Stores individual products included in each order, including quantity and purchase price.

## Reporting Queries

The SQL file includes 10 reporting queries:

1. **Catalog Overview** — Shows products with their categories and prices.
2. **Order Summary** — Shows order details and applied discounts.
3. **Line-Item Breakdown** — Calculates the subtotal for each order item.
4. **Customer Lifetime Value (CLV)** — Shows total orders and total spending by customer.
5. **Top Performing Products** — Shows products based on total units sold.
6. **Departmental Revenue** — Calculates revenue for each category.
7. **Active Promotions** — Lists currently active and valid discounts.
8. **Promotion Impact** — Compares discounted and non-discounted orders.
9. **System Access Audit** — Shows each user and their assigned role.
10. **Inventory Audit Trail** — Shows inventory changes in chronological order.

## How to Run

### Requirements

- MySQL Server
- MySQL Workbench or another MySQL-compatible SQL editor

### Steps

1. Open MySQL Workbench.
2. Open the SQL file:
   `2024-SE-31-Lab02-POS_modified.sql`
3. Run the complete SQL script.
4. The script creates the `Point_of_Sale` database automatically.
5. The tables and sample data are inserted automatically.
6. Run the reporting queries at the end of the script to view the results.

## Project Structure

```text
Point_of_Sale
│
├── roles
├── permissions
├── role_permissions
├── users
├── categories
├── products
├── inventory_logs
├── discount_rules
├── orders
└── order_items
```

## Sample User Data

The project contains sample Admin, Salesman, and Customer accounts. The usernames have been customized while keeping the original database structure and functionality unchanged.

## Important Note

This project is designed for database/lab practice. The SQL file contains sample data and reporting queries. The database relationships and query functionality should remain unchanged when modifying sample names.

## Author

**Lab 02 — Point of Sale (POS) Database**

**Roll Number:** 2024-SE-40
