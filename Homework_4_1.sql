------------------------- Домашняя работа 4 -------------------------
-- Задание 1: DML 

-- 1. Вставить двух новых сотрудников в таблицу Employees.
INSERT INTO employees (FirstName, LastName, Department, Salary) VALUES 
('Tyrion', 'Lannister', 'Finance', 90000.00), 
('Sandor', 'Clegane', 'IT', 75000.00);

-- 2. Выбрать всех сотрудников из таблицы Employees. 
SELECT * FROM employees;

-- 3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'. 
SELECT firstname, lastname FROM employees
WHERE department = 'IT';

-- 4. Обновить Salary 'Alice Smith' до 65000.00. 
UPDATE employees
SET salary = 65000.00
WHERE lastname = 'Smith' AND firstname = 'Alice';

-- 5. Удалить сотрудника, чья LastName — 'Prince'.
DELETE FROM employeeprojects 
WHERE employeeid IN (
    SELECT employeeid FROM employees WHERE lastname = 'Prince'
);

DELETE FROM employees WHERE lastname = 'Prince';