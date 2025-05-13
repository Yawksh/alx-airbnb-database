### Partitioning Performance Report

**Before Partitioning:**
- Booking lookup in January 2025 took 800ms

**After Partitioning:**
- Lookup reduced to 100ms

**Conclusion:**
- Range partitioning on start_date drastically improved query performance on date filters.
