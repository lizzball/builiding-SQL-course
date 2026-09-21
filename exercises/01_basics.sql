-- BUILDING SQL COURSE
-- Lesson 01: SELECT, WHERE, ORDER BY, LIMIT
--
-- Run:
-- sqlite3 practice.db
--
-- Then:
-- .headers on
-- .mode column

-- 1. Return every laboratory test.
SELECT *
FROM lab_tests;

-- 2. TODO: Return only test_id, patient_id, biomarker_a,
-- biomarker_b, and biomarker_c.


-- 3. TODO: Return only patients with disease_status = 'disease'.


-- 4. TODO: Find tests where biomarker_a is below 27.


-- 5. TODO: Sort all tests from LOWEST biomarker_a
-- to HIGHEST biomarker_a.


-- 6. TODO: Return the five tests with the lowest biomarker_a.


-- 7. TODO: Find tests collected on or after June 1, 2026.


-- 8. TODO: Find disease cases where biomarker_a is greater than 28.
-- These are interesting because Biomarker A tends to be lower in disease.


-- CHALLENGE
-- Find control samples with biomarker_a below 27.
-- Why might these matter if you were using A as a diagnostic threshold?
