-- ============================================================
-- PART A: DEDUPLICATION AND JOIN DIAGNOSTICS
-- ============================================================


-- 1. Find every duplicated partner_id
SELECT
    partner_id,
    COUNT(*) AS duplicate_count
FROM partners_import
GROUP BY partner_id
HAVING COUNT(*) > 1
ORDER BY partner_id;


-- 2. Create the clean partners table
DROP TABLE IF EXISTS partners;

CREATE TABLE partners AS
SELECT
    partner_id,
    city,
    primary_category,
    rating,
    active,
    days_since_onboarding
FROM partners_import
GROUP BY
    partner_id,
    city,
    primary_category,
    rating,
    active,
    days_since_onboarding;


-- 3. Verify the clean partners table
SELECT COUNT(*) AS clean_partner_count
FROM partners;


-- 4. INNER JOIN: confirm every booking resolves
-- to a real partner
SELECT
    b.booking_id,
    b.partner_id,
    p.city,
    p.primary_category
FROM bookings AS b
INNER JOIN partners AS p
    ON b.partner_id = p.partner_id
ORDER BY b.booking_id;


-- 5. LEFT JOIN: find categories with zero bookings
SELECT
    c.category
FROM categories AS c
LEFT JOIN bookings AS b
    ON c.category = b.category
WHERE b.booking_id IS NULL
ORDER BY c.category;


-- 6. LEFT JOIN: find partners with zero bookings
SELECT
    p.partner_id,
    p.city,
    p.primary_category
FROM partners AS p
LEFT JOIN bookings AS b
    ON p.partner_id = b.partner_id
WHERE b.booking_id IS NULL
ORDER BY p.partner_id;


-- 7. COUNT(*) versus COUNT(b.booking_id)
SELECT
    c.category,
    COUNT(*) AS joined_rows,
    COUNT(b.booking_id) AS booking_count
FROM categories AS c
LEFT JOIN bookings AS b
    ON c.category = b.category
GROUP BY c.category
ORDER BY c.category;

-- For the zero-booking category, COUNT(*) counts the
-- unmatched category row, while COUNT(b.booking_id)
-- counts only rows containing a real booking.