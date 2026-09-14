-- ============================================================
-- PART A: INSERT AND DELETE
-- ============================================================

-- 1. Remove the 3 test/dummy bookings
-- 1. Remove the 3 test/dummy bookings
DELETE FROM bookings
WHERE is_test = 1;

-- 2. Insert the 3 required real bookings
-- 2. Insert the 3 required real bookings
INSERT INTO bookings
(booking_id, partner_id, city, category, booking_date, amount_inr, complaint_flag, sla_breach_flag, is_test)
VALUES
('B9001', 'P009', 'Mumbai', 'Deep Home Cleaning', '2026-03-31', 3200, 5, 0, 0),
('B9002', 'P041', 'Chennai', 'Plumbing', '2026-03-31', 640, 4, 0, 0),
('B9003', 'P035', 'Hyderabad', 'Electrical Repair', '2026-03-31', 980, NULL, 0, 0);


-- 3. Verify the final booking count and revenue
SELECT
    COUNT(*) AS booking_count,
    SUM(amount_inr) AS total_revenue
FROM bookings;

-- Expected result: 600 rows, ₹10,47,973 total.


-- 4. Find every partner whose category starts with "Salon"
SELECT
    partner_id,
    city,
    primary_category,
    rating,
    active,
    days_since_onboarding
FROM partners
WHERE primary_category LIKE 'Salon%'
ORDER BY partner_id;


-- 5. Final city-category summary
SELECT
    city,
    category,
    COUNT(*) AS bookings_count,
    SUM(amount_inr) AS revenue_inr,
    SUM(sla_breach_flag) AS sla_breaches
FROM bookings
GROUP BY city, category
ORDER BY city, category;