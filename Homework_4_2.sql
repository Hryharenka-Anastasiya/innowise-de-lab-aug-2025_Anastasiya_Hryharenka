------------------------- Домашняя работа 4 -------------------------
-- Задание 2: DDL

-- 1. Создать новую таблицу с именем Departments со столбцами: 
-- DepartmentID (SERIAL PRIMARY KEY), DepartmentName 
-- (VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)). 
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);


-- 2. Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)).  
ALTER TABLE employees
ADD COLUMN Email VARCHAR(100);


-- 3. Добавить ограничение UNIQUE к столбцу Email в таблице Employees, предварительно заполнив любыми значениями.
UPDATE employees
SET email = CONCAT(firstname, lastname, '@some.com');

ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);


-- 4. Переименовать столбец Location в таблице Departments в OfficeLocation. 
ALTER TABLE departments
RENAME COLUMN location TO officeLocation;