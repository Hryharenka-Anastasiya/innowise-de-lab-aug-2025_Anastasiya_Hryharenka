------------------------- Домашняя работа 4 -------------------------
-- Задание 3: DCL 

-- 1. Создать нового пользователя PostgreSQL (роль) с именем hr_user и простым паролем. 
GRANT USAGE ON SCHEMA laba4 TO hr_user;
CREATE ROLE hr_user WITH LOGIN PASSWORD 'hr2025';

-- 2. Предоставить hr_user право SELECT на таблицу Employees. 
GRANT SELECT ON TABLE laba4.employees TO hr_user;

-- 3. Как пользователь-администратор, предоставить hr_user права INSERT и UPDATE на таблицу Employees. 
GRANT USAGE, SELECT ON SEQUENCE employees_employeeid_seq TO hr_user;
GRANT INSERT, UPDATE ON TABLE laba4.employees TO hr_user;


-- Скрины тестов находятся в вордовском файле Laba_4_tests
-----------------------------------------------------------------------------------
                               -- Tests --
SELECT SESSION_USER, CURRENT_USER;

SET SESSION AUTHORIZATION 'hr_user';
SET SESSION AUTHORIZATION 'postgres';


SELECT * FROM laba4.employees;

INSERT INTO laba4.employees (FirstName, LastName, Department, Salary) VALUES 
('Eddard', 'Stark', 'HR', 80000.00);

UPDATE laba4.employees SET email = 'Edd@mail.ru' 
WHERE lastname = 'Stark' AND firstname = 'Eddard';

SELECT * FROM laba4.employees;