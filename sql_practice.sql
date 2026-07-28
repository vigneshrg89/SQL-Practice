use test

CREATE TABLE students_dts(
stu_id INT PRIMARY KEY AUTO_INCREMENT,
stu_name VARCHAR(20),
stu_age INT,
marks INT,
city VARCHAR(50)
)

INSERT INTO students_dts (stu_name,stu_age,marks,city) VALUES  ( "VICKY", 21, 78, "COIMBATORE"),
 ( "ROHITH", 20, 98, "CHENNAI"),
( "JAMSHEER", 19, 90, "CHENNAI"),
( "VISHNU" ,19, 85, "DELHI"),
( "HARI", 21, 36, "CHENNAI"),
( "RAVI", 20, 63, "COIMBATORE")

SELECT * FROM students_dts

SELECT stu_name,marks FROM students_dts

SELECT * FROM students_dts WHERE  marks > 80 

SELECT * FROM students_dts WHERE city = "CHENNAI"

SELECT * FROM students_dts WHERE stu_age > 20

SELECT * FROM students_dts WHERE marks BETWEEN 60 AND 80

SELECT * FROM students_dts WHERE stu_name LIKE 'V%'

SELECT * FROM students_dts WHERE city <> "CHENNAI" 

SELECT * FROM students_dts ORDER BY marks DESC

SELECT * FROM students_dts ORDER BY marks DESC LIMIT 4

SELECT COUNT(*) AS Total_Students FROM students_dts

SELECT AVG(marks) AS Average_Marks FROM students_dts

SELECT MAX(marks) AS Maximum_Marks FROM students_dts

SELECT MIN(marks) AS Minimum_Marks FROM students_dts

SELECT SUM(marks) AS Totalmarks FROM students_dts

SELECT city, COUNT(*) AS Total_Students FROM students_dts GROUP BY city

SELECT city, AVG(marks) AS Average_Marks_city FROM students_dts GROUP BY city

SELECT city, COUNT(*) AS Total_Students FROM students_dts GROUP BY city

SELECT city, AVG(marks) AS Average_Marks_city FROM students_dts GROUP BY city

SELECT city, AVG(marks) AS Average_Marks_city FROM students_dts GROUP BY city HAVING AVG(marks) > 70

SELECT city, COUNT(*) AS More_than_2stu FROM students_dts GROUP BY city HAVING COUNT(*) > 2

CREATE TABLE Orders_details(
order_id INT PRIMARY KEY,
cus_name VARCHAR(50),
order_date DATE,
amount DECIMAL(10,2)
)

INSERT INTO Orders_details VALUES (101, 'Rahul',  '2026-07-25', 1500.50),
(102, 'Vignesh', '2026-07-24', 2200.00),
(103, 'Arun',    '2026-07-22', 999.99),
(104, 'Priya',   '2026-07-20', 1750.75),
(105, 'Kavin',   '2026-07-18', 3200.00),
(106, 'Anitha',  '2026-07-10', 850.25),
(107, 'Ramesh',  '2024-11-15', 4100.50),
(108, 'Sneha',   '2024-05-28', 600.00),
(109, 'Karthik', '2023-12-31', 2800.80),
(110, 'Meena',   '2026-01-01', 1950.40);

SELECT * FROM Orders_details;

SELECT * FROM Orders_details WHERE order_date = CURDATE();

SELECT * FROM Orders_details WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

SELECT * FROM Orders_details WHERE YEAR(order_date) = 2024;

SELECT DATEDIFF('2024-12-31', '2024-12-01') AS Difference_Days;

SELECT YEAR(order_date) AS Order_Year FROM Orders_details;

SELECT MONTH(order_date) AS Order_Month FROM Orders_details;


CREATE TABLE Customers1 (
    id INT PRIMARY KEY,
    cus_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders_dts (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Customers1 VALUES (1,'Rahul','Chennai'),
(2,'Vignesh','Coimbatore'),
(3,'Arun','Madurai'),
(4,'Priya','Salem'),
(5,'Sneha','Delhi');

INSERT INTO Orders_dts VALUES (101,1,1500.00),
(102,2,2500.00),
(103,2,1800.00),
(104,4,3000.00);

SELECT * FROM Customers1;

SELECT * FROM Orders_dts;

SELECT c.cus_name, o.amount FROM Customers1 AS c
INNER JOIN Orders1 o
ON c.id = o.customer_id;

SELECT c.cus_name, o.amount FROM Customers1 AS c
LEFT JOIN Orders1 o
ON c.id = o.customer_id;

SELECT DISTINCT c.cus_name FROM Customers1 As c
INNER JOIN Orders1 o
ON c.id = o.customer_id;

SELECT c.cus_name FROM Customers1 AS c
LEFT JOIN Orders1 o
ON c.id = o.customer_id
WHERE o.order_id IS NULL;

SELECT c.cus_name, SUM(o.amount) AS Total_Amount FROM Customers1 AS c
INNER JOIN Orders1 o
ON c.id = o.customer_id
GROUP BY c.cus_name;


CREATE TABLE Patients1 (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50)
);

CREATE TABLE Doctors1 (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE Appointments1 (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE
);

CREATE TABLE Prescriptions1 (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medicine VARCHAR(50)
);

INSERT INTO Patients1 VALUES (1,'Rahul'),
(2,'Vignesh'),
(3,'Priya'),
(4,'Arun');

INSERT INTO Doctors1 VALUES (101,'Dr. Kumar','Cardiologist'),
(102,'Dr. Meena','Dermatologist'),
(103,'Dr. Ravi','Orthopedic'),
(104,'Dr. Suresh','Neurologist');

INSERT INTO Appointments1 VALUES (201,1,101,'2026-07-20'),
(202,2,102,'2026-07-21'),
(203,1,103,'2026-07-22');

INSERT INTO Prescriptions1 VALUES (301,201,'Paracetamol'),
(302,202,'Vitamin C');

SELECT * FROM Patients1;

SELECT * FROM Doctors1;

SELECT * FROM Appointments1;

SELECT * FROM prescriptions1;


SELECT p.patient_name, d.doctor_name FROM Patients1 p
INNER JOIN Appointments1 a
ON p.patient_id = a.patient_id
INNER JOIN Doctors1 d
ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, d.specialization, a.appointment_date FROM Patients1 p
INNER JOIN Appointments1 a
ON p.patient_id = a.patient_id
INNER JOIN Doctors1 d
ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, pr.medicine FROM Patients1 p
INNER JOIN Appointments1 a
ON p.patient_id = a.patient_id
INNER JOIN Prescriptions1 pr
ON a.appointment_id = pr.appointment_id;

SELECT a.appointment_date, p.patient_name, d.doctor_name FROM Appointments1 a
INNER JOIN Patients1 p
ON a.patient_id = p.patient_id
INNER JOIN Doctors1 d
ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, a.appointment_date FROM Patients1 p
LEFT JOIN Appointments1 a
ON p.patient_id = a.patient_id;

SELECT a.appointment_id, pr.medicine FROM Appointments1 a
LEFT JOIN Prescriptions1 pr
ON a.appointment_id = pr.appointment_id;

SELECT d.doctor_name, p.patient_name FROM Doctors1 d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
LEFT JOIN Patients1 p
ON a.patient_id = p.patient_id;

SELECT p.patient_name, d.doctor_name FROM Patients1 p
LEFT JOIN Appointments1 a
ON p.patient_id = a.patient_id
LEFT JOIN Doctors1 d
ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, d.doctor_name FROM Appointments1 a
RIGHT JOIN Doctors1 d
ON a.doctor_id = d.doctor_id
LEFT JOIN Patients1 p
ON a.patient_id = p.patient_id;

SELECT pr.medicine, a.appointment_date FROM Appointments1 a
RIGHT JOIN Prescriptions1 pr
ON a.appointment_id = pr.appointment_id;

SELECT p.patient_name, d.doctor_name FROM Patients1 p
LEFT JOIN Appointments1 a
ON p.patient_id = a.patient_id
LEFT JOIN Doctors1 d
ON a.doctor_id = d.doctor_id

UNION

SELECT p.patient_name, d.doctor_name FROM Doctors1 d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
LEFT JOIN Patients1 p
ON a.patient_id = p.patient_id;

ALTER TABLE Patients1 ADD age INT;

UPDATE Patients1 SET age = 25 WHERE patient_id = 1;
UPDATE patients1 SET age = 21 WHERE patient_id = 2;
UPDATE patients1 SET age = 55 WHERE patient_id = 3;
UPDATE patients1 SET age = 60 WHERE patient_id = 4;
SELECT * FROM Patients1;

SELECT d.doctor_name, COUNT(*) AS Total_Appointments FROM Doctors1 d
JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY Total_Appointments DESC
LIMIT 1;

SELECT p.patient_name FROM Patients1 p
LEFT JOIN Appointments1 a
ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

SELECT a.appointment_id, a.appointment_date FROM Appointments1 a
LEFT JOIN Prescriptions1 pr
ON a.appointment_id = pr.appointment_id
WHERE pr.prescription_id IS NULL;

SELECT d.doctor_name FROM Doctors1 d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

SELECT p.patient_name, d.doctor_name, COUNT(*) AS Visits FROM Patients1 p
JOIN Appointments1 a
ON p.patient_id = a.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id
GROUP BY p.patient_name, d.doctor_name
HAVING COUNT(*) > 1;

SELECT DISTINCT d.doctor_name FROM Doctors1 d
JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
JOIN Patients p
ON a.patient_id = p.patient_id
WHERE p.age > 50;

SELECT d.doctor_name, COUNT(DISTINCT a.patient_id) AS Total_Patients FROM Doctors1 d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

SELECT d.doctor_name, COUNT(DISTINCT a.patient_id) AS Total_Patients FROM Doctors1 d
JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY Total_Patients DESC
LIMIT 1;

SELECT d.specialization, COUNT(a.appointment_id) AS Total_Appointments FROM Doctors1 d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
GROUP BY d.specialization;

SELECT p.patient_name FROM Patients1 p
JOIN Appointments1 a
ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING COUNT(DISTINCT a.doctor_id) > 1;

SELECT d.doctor_name, COUNT(pr.prescription_id) AS Total_Prescriptions1 FROM Doctors d
LEFT JOIN Appointments1 a
ON d.doctor_id = a.doctor_id
LEFT JOIN Prescriptions1 pr
ON a.appointment_id = pr.appointment_id
GROUP BY d.doctor_name;


