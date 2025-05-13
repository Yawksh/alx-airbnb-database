### Performance Monitoring Summary

**Tools Used:** EXPLAIN ANALYZE, SHOW PROFILE

**Findings:**
- Missing indexes on `reviews(property_id)`
- Queries retrieving all bookings without LIMIT were slow

**Fixes Applied:**
- Added `idx_review_property_id` index
- Added LIMITs for pagination

**Results:**
- Reduced query time by ~75%
