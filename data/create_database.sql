PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS lab_tests;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS ordering_doctors;

-- Fully synthetic diagnostic-lab database.
-- No row represents a real patient, physician, or test result.

CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY,
    age INTEGER NOT NULL,
    sex TEXT NOT NULL CHECK (sex IN ('F', 'M')),
    province TEXT NOT NULL
);

-- For this learning database, order_id identifies the ordering physician.
CREATE TABLE ordering_doctors (
    order_id INTEGER PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE lab_tests (
    test_id TEXT PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    collection_date DATE NOT NULL,
    disease_status TEXT NOT NULL CHECK (disease_status IN ('control', 'disease')),
    biomarker_a REAL NOT NULL CHECK (biomarker_a BETWEEN 20 AND 35),
    biomarker_b REAL NOT NULL CHECK (biomarker_b BETWEEN 20 AND 35),
    biomarker_c REAL NOT NULL CHECK (biomarker_c BETWEEN 20 AND 35),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (order_id) REFERENCES ordering_doctors(order_id)
);

INSERT INTO ordering_doctors
(order_id, doctor_name, specialty, city)
VALUES
(501, 'Dr. Mira Patel', 'Family Medicine', 'Hamilton'),
(502, 'Dr. Adrian Chen', 'Internal Medicine', 'Toronto'),
(503, 'Dr. Samira Roy', 'Gynecology', 'Ottawa'),
(504, 'Dr. Lucas Martin', 'Family Medicine', 'Montreal'),
(505, 'Dr. Avery Brooks', 'Internal Medicine', 'Vancouver');

INSERT INTO patients
(patient_id, age, sex, province)
VALUES
(1, 71, 'M', 'ON'),
(2, 58, 'F', 'ON'),
(3, 56, 'M', 'ON'),
(4, 69, 'F', 'QC'),
(5, 24, 'M', 'BC'),
(6, 51, 'F', 'ON'),
(7, 29, 'M', 'ON'),
(8, 46, 'F', 'ON'),
(9, 48, 'M', 'QC'),
(10, 64, 'F', 'BC'),
(11, 26, 'M', 'ON'),
(12, 29, 'F', 'ON'),
(13, 47, 'M', 'ON'),
(14, 66, 'F', 'QC'),
(15, 34, 'M', 'BC'),
(16, 53, 'F', 'ON'),
(17, 67, 'M', 'ON'),
(18, 27, 'F', 'ON'),
(19, 37, 'M', 'QC'),
(20, 69, 'F', 'BC'),
(21, 53, 'M', 'ON'),
(22, 71, 'F', 'ON'),
(23, 49, 'M', 'ON'),
(24, 32, 'F', 'QC'),
(25, 64, 'M', 'BC'),
(26, 62, 'F', 'ON'),
(27, 59, 'M', 'ON'),
(28, 70, 'F', 'ON'),
(29, 45, 'M', 'QC'),
(30, 53, 'F', 'BC'),
(31, 72, 'M', 'ON'),
(32, 64, 'F', 'ON'),
(33, 72, 'M', 'ON'),
(34, 57, 'F', 'QC'),
(35, 47, 'M', 'BC'),
(36, 43, 'F', 'ON'),
(37, 70, 'M', 'ON'),
(38, 72, 'F', 'ON'),
(39, 34, 'M', 'QC'),
(40, 51, 'F', 'BC');

INSERT INTO lab_tests
(test_id, patient_id, order_id, collection_date, disease_status, biomarker_a, biomarker_b, biomarker_c)
VALUES
('T0001', 1, 501, '2026-01-05', 'control', 29.25, 27.32, 27.91),
('T0002', 2, 502, '2026-01-10', 'control', 31.28, 31.48, 30.76),
('T0003', 3, 503, '2026-01-15', 'control', 31.75, 29.32, 29.99),
('T0004', 4, 504, '2026-01-20', 'control', 29.91, 24.92, 26.20),
('T0005', 5, 505, '2026-01-25', 'control', 27.83, 24.96, 28.84),
('T0006', 6, 501, '2026-01-30', 'control', 32.75, 27.89, 26.67),
('T0007', 7, 502, '2026-02-04', 'control', 28.85, 29.17, 30.47),
('T0008', 8, 503, '2026-02-09', 'control', 29.02, 25.88, 29.88),
('T0009', 9, 504, '2026-02-14', 'control', 26.14, 24.72, 27.79),
('T0010', 10, 505, '2026-02-19', 'control', 26.65, 29.85, 29.23),
('T0011', 11, 501, '2026-02-24', 'control', 26.09, 24.03, 24.61),
('T0012', 12, 502, '2026-03-01', 'control', 27.85, 25.25, 24.40),
('T0013', 13, 503, '2026-03-06', 'control', 32.56, 23.37, 26.12),
('T0014', 14, 504, '2026-03-11', 'control', 31.40, 29.17, 30.28),
('T0015', 15, 505, '2026-03-16', 'control', 29.00, 34.34, 26.07),
('T0016', 16, 501, '2026-03-21', 'control', 26.96, 25.75, 27.79),
('T0017', 17, 502, '2026-03-26', 'control', 24.33, 33.61, 26.09),
('T0018', 18, 503, '2026-03-31', 'control', 27.24, 25.65, 32.17),
('T0019', 19, 504, '2026-04-05', 'control', 29.68, 28.51, 27.38),
('T0020', 20, 505, '2026-04-10', 'control', 31.34, 30.90, 26.45),
('T0021', 21, 501, '2026-04-15', 'disease', 24.42, 31.55, 23.63),
('T0022', 22, 502, '2026-04-20', 'disease', 29.05, 28.76, 29.31),
('T0023', 23, 503, '2026-04-25', 'disease', 24.06, 26.98, 23.41),
('T0024', 24, 504, '2026-04-30', 'disease', 23.20, 21.56, 35.00),
('T0025', 25, 505, '2026-05-05', 'disease', 24.75, 27.73, 29.40),
('T0026', 26, 501, '2026-05-10', 'disease', 26.14, 30.07, 31.52),
('T0027', 27, 502, '2026-05-15', 'disease', 27.97, 28.87, 31.39),
('T0028', 28, 503, '2026-05-20', 'disease', 25.73, 28.07, 27.90),
('T0029', 29, 504, '2026-05-25', 'disease', 29.55, 31.64, 28.22),
('T0030', 30, 505, '2026-05-30', 'disease', 21.69, 30.09, 29.99),
('T0031', 31, 501, '2026-06-04', 'disease', 29.64, 27.89, 26.88),
('T0032', 32, 502, '2026-06-09', 'disease', 20.00, 30.48, 33.37),
('T0033', 33, 503, '2026-06-14', 'disease', 24.77, 31.61, 27.04),
('T0034', 34, 504, '2026-06-19', 'disease', 24.93, 31.46, 33.67),
('T0035', 35, 505, '2026-06-24', 'disease', 28.63, 25.95, 26.94),
('T0036', 36, 501, '2026-06-29', 'disease', 25.88, 31.62, 24.81),
('T0037', 37, 502, '2026-07-04', 'disease', 25.92, 29.87, 27.24),
('T0038', 38, 503, '2026-07-09', 'disease', 25.40, 26.74, 28.29),
('T0039', 39, 504, '2026-07-14', 'disease', 24.58, 27.50, 24.82),
('T0040', 40, 505, '2026-07-19', 'disease', 20.90, 27.26, 33.45);

CREATE INDEX idx_lab_tests_patient_id
    ON lab_tests(patient_id);

CREATE INDEX idx_lab_tests_order_id
    ON lab_tests(order_id);

CREATE INDEX idx_lab_tests_disease_status
    ON lab_tests(disease_status);

CREATE INDEX idx_lab_tests_biomarker_a
    ON lab_tests(biomarker_a);
