# Database Normalization to Third Normal Form (3NF)

## Steps Taken to Achieve 3NF

### 1. **Removed Derived Attributes**
- **Issue**: `total_price` in `bookings` is calculated as `pricepernight * (end_date - start_date)`.
- **Action**: Removed `total_price` to eliminate redundancy.

### 2. **Normalized Location Data**
- **Issue**: The `location` field in `properties` combined city, state, and country.
- **Action**:
  - Created a `locations` table with `location_id`, `city`, `state`, `country`.
  - Replaced `location` in `properties` with `location_id` (foreign key).

### 3. **Replaced ENUMs with Reference Tables**
- **Issue**: ENUMs like `role` and `status` can cause maintenance issues.
- **Action**:
  - Created `roles`, `booking_statuses`, and `payment_methods` tables.
  - Replaced ENUM columns with foreign keys (e.g., `role_id` in `users`).

### 4. **Improved Review Integrity**
- **Issue**: Reviews were linked directly to properties/users, not bookings.
- **Action**: Linked `reviews` to `bookings` to ensure reviews come from actual guests.

## Trade-offs
- **Query Complexity**: Computed fields like `total_price` require runtime calculations.
- **Scalability**: Reference tables add joins but improve maintainability.