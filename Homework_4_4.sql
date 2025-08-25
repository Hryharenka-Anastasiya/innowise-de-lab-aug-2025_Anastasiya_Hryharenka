-- Задание 4: DML/DCL

-- 1.Увеличить Salary всех сотрудников в отделе 'HR' на 10%. 
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'HR';


-- 2.Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'. 
UPDATE employees
SET department = 'Senior IT'
WHERE salary > 70000.00;


-- 3. Удалить всех сотрудников, которые не назначены ни на один проект в 
-- таблице EmployeeProjects. Подсказка: Используйте подзапрос NOT EXISTS или LEFT JOIN 
DELETE FROM employees
WHERE NOT EXISTS (
    SELECT * FROM employeeprojects
    WHERE employeeprojects.employeeid = employees.employeeid
);


-- 4. Вставить новый проект и назначить на него двух существующих 
-- сотрудников с определенным количеством HoursWorked в 
-- EmployeeProjects, и все это в одном блоке BEGIN/COMMIT. 
BEGIN;
    INSERT INTO projects (projectname, budget, startdate, enddate)
    VALUES ('Iron Bank of Braavos', 70000.00, '2025-08-17', '2027-08-17')
    RETURNING projectid ;
	
    INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
	VALUES 
	    (2, lastval(), 100),  
	    (3, lastval(), 120);
COMMIT;
