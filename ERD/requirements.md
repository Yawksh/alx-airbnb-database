# Airbnb Clone - Entity-Relationship Diagram (ERD)

This document defines the database schema for the Airbnb Clone project using an Entity-Relationship Diagram (ERD). The schema includes entities, relationships, constraints, and indexes to ensure data integrity and performance.

---
## Visualizing the ERD


2. **Example ERD Layout**:  
   ![ER Diagram](https://github.com/Yawksh/alx-airbnb-database/blob/main/ERD/erd_final.drawio.png) 

## Entities and Attributes

### **1. User**
- `user_id` (UUID, Primary Key)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **2. Property**
- `property_id` (UUID, Primary Key)
- `host_id` (UUID, Foreign Key → User.user_id, NOT NULL)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### **3. Booking**
- `booking_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id, NOT NULL)
- `user_id` (UUID, Foreign Key → User.user_id, NOT NULL)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **4. Payment**
- `payment_id` (UUID, Primary Key)
- `booking_id` (UUID, Foreign Key → Booking.booking_id, NOT NULL)
- `amount` (DECIMAL, NOT NULL)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **5. Review**
- `review_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id, NOT NULL)
- `user_id` (UUID, Foreign Key → User.user_id, NOT NULL)
- `rating` (INT, CHECK: 1 ≤ rating ≤ 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **6. Message**
- `message_id` (UUID, Primary Key)
- `sender_id` (UUID, Foreign Key → User.user_id, NOT NULL)
- `recipient_id` (UUID, Foreign Key → User.user_id, NOT NULL)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships

| Relationship                   | Description                                                                 | Foreign Key(s)                     |
|--------------------------------|-----------------------------------------------------------------------------|------------------------------------|
| **User → Property (1:N)**      | A host (User) can list multiple Properties.                                 | `host_id` in `Property`            |
| **Property → Booking (1:N)**   | A Property can have multiple Bookings.                                      | `property_id` in `Booking`         |
| **User → Booking (1:N)**       | A guest (User) can make multiple Bookings.                                  | `user_id` in `Booking`             |
| **Booking → Payment (1:1)**    | Each Booking has exactly one Payment.                                       | `booking_id` in `Payment`          |
| **Property → Review (1:N)**    | A Property can receive multiple Reviews.                                    | `property_id` in `Review`          |
| **User → Review (1:N)**        | A User can write multiple Reviews.                                          | `user_id` in `Review`              |
| **User → Message (1:N)**       | A User can send multiple Messages.                                          | `sender_id` in `Message`           |
| **User → Message (1:N)**       | A User can receive multiple Messages.                                       | `recipient_id` in `Message`        |

---

## Constraints

### **1. Primary Keys**
- All entities use a UUID as the primary key.

### **2. Foreign Keys**
- Enforce referential integrity between tables (e.g., `host_id` in `Property` references `User.user_id`).

### **3. Unique Constraints**
- `email` in the `User` table must be unique.

### **4. Check Constraints**
- `rating` in the `Review` table must be between 1 and 5.

### **5. ENUM Constraints**
- `role` (User): `guest`, `host`, `admin`.
- `status` (Booking): `pending`, `confirmed`, `canceled`.
- `payment_method` (Payment): `credit_card`, `paypal`, `stripe`.

### **6. Non-Null Constraints**
- Required fields (e.g., `first_name`, `email`, `pricepernight`) are marked `NOT NULL`.

---

## Indexes

### **1. Primary Key Indexes**
- Automatically created for all UUID primary keys.

### **2. Additional Indexes**
- `email` in the `User` table for fast lookups.
- `property_id` in the `Property` and `Booking` tables for efficient querying.
- `booking_id` in the `Payment` table for quick joins.

---



---


