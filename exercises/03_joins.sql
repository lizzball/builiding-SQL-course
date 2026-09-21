-- Lesson 03: JOINs

-- 1. Join lab_tests to patients so every test also shows:
-- age, sex, and province.


-- 2. Join lab_tests to ordering_doctors so every test shows:
-- test_id, patient_id, doctor_name, specialty, and collection_date.


-- 3. Join all THREE tables:
-- lab_tests + patients + ordering_doctors.


-- 4. Calculate the number of tests ordered by each doctor.


-- 5. Calculate average biomarker_a by doctor.


-- 6. Calculate average biomarker_a by disease_status
-- after joining patient information.


-- CHALLENGE
-- Return:
-- test_id
-- patient_id
-- age
-- doctor_name
-- disease_status
-- biomarker_a
--
-- but only for tests where biomarker_a < 27.
