-- JOIN PRACTICE
-- Connect laboratory results to patient demographics.

SELECT lab_tests.test_id,
       lab_tests.patient_id,
       patients.age,
       patients.sex,
       patients.province,
       lab_tests.disease_status,
       lab_tests.biomarker_a
FROM lab_tests
JOIN patients
ON lab_tests.patient_id = patients.patient_id
LIMIT 10;
