# Airbnb Clone Database Schema (DDL)

## Overview
This directory contains the SQL Data Definition Language (DDL) scripts to create the database schema for the Airbnb-like application. The schema defines tables, constraints, and indexes to ensure data integrity and optimal performance.

## Schema Script
- **File**: `schema.sql`  
- **Description**: Creates tables for users, properties, bookings, payments, reviews, messages, and reference tables (roles, statuses, etc.).

## Instructions

### 1. **Prerequisites**
- PostgreSQL 12+ installed.
- Ensure the `uuid-ossp` extension is enabled (used for UUID primary keys).

### 2. **Run the Schema Script**
```bash
# Replace `your_database` with your database name
psql -U your_username -d your_database -f schema.sql