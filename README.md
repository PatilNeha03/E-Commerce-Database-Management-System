# E-Commerce Database Management System

This project entails designing and implementing a robust database management system tailored for an E-commerce platform, specifically modeled around Amazon’s business-to-consumer (B2C) operations. The goal is to efficiently handle customer, seller, product, and transactional data, providing insightful analytics and enhanced user experiences.

## Project Objective

- Develop a scalable and efficient database system to manage consumer and seller data.
- Analyze customer behavior to forecast trends and personalize user experiences.

## Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Key Features](#key-features)
- [Data Analysis](#data-analysis)
- [Technical Implementation](#technical-implementation)
- [Recommendations](#recommendations)
- [Setup and Execution](#setup-and-execution)
- [Technologies Used](#technologies-used)

## Overview

The system captures and manages details about products, users (consumers and sellers), transactions, reviews, payments, and shipments. It employs both SQL (MySQL) for structured data and NoSQL (MongoDB Compass) for flexible data management, integrated with Python for analytics.

## Database Schema

### SQL Database (MySQL):
- **Entities:** User Accounts, Products, Orders, Payments, Reviews, Wishlist, Shopping Cart, Warehouses, Carriers.
- **Relationships:**
  - One-to-many (User to Orders, Products)
  - Many-to-many (Products and Orders via Shopping Cart)
  - Hierarchical and weak entities (Wishlist, Shopping Cart)

### NoSQL Database (MongoDB):
- Aggregated collections for transaction analysis
- Prime membership tracking
- High-value item analysis

## Key Features

- User registration and subscription management
- Seller and consumer profile management
- Order processing and tracking
- Inventory and warehouse management
- Advanced analytics on consumer behaviors

## Data Analysis

Implemented analytical queries and visualizations:
- Top 10 frequently ordered items
- Seller performance by product type (retail, wholesale)
- Prime versus non-prime membership analysis
- Customer order trends and spending patterns

## Technical Implementation

### Database Creation and Management
- Entity-Relationship (EER) and UML modeling
- SQL table definitions, constraints, and relationships
- Integration of NoSQL for complex querying and analytics

### Analytical Tools
- Python (Jupyter Notebook) for data manipulation and visualizations
- SQL for querying relational data
- MongoDB aggregation for NoSQL insights

## Recommendations

Based on analytical insights, recommended strategies include:
- **Pricing Strategies:** Regularly reviewing pricing of top-selling products.
- **Inventory Management:** Ensuring stock availability of high-demand items.
- **Targeted Marketing:** Emphasizing premium products in marketing campaigns.
- **Competitor Benchmarking:** Regularly assessing market competitiveness.
- **Customer Segmentation:** Personalized marketing based on user purchase behavior.

## Setup and Execution

### Prerequisites

- MySQL Server
- MongoDB Compass
- Python (Jupyter Notebook, Pandas, Matplotlib)


### Execution

```bash
git clone <repository-url>
jupyter notebook
```

## Technologies Used

- MySQL (Relational Database Management)
- MongoDB Compass (NoSQL Database Management)
- Python (Pandas, Matplotlib for Data Analysis)
- Jupyter Notebook
