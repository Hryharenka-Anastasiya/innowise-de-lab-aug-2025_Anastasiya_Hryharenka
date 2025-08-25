-- Задание 6: DML (Optional)


-- 1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов.
SELECT projectname FROM projects
JOIN employeeprojects 
ON projects.projectid = employeeprojects.projectid
JOIN employees
ON employeeprojects.employeeid = employees.employeeid
WHERE employees.lastname = 'Johnson' 
AND employees.firstname = 'Bob'
AND employeeprojects.hoursworked > 150;


-- 2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя 
-- бы один сотрудник из отдела 'IT'. 
UPDATE projects
SET budget = budget * 1.10
WHERE projectid IN (
    SELECT DISTINCT employeeprojects.projectid
    FROM employeeprojects
    JOIN employees ON employeeprojects.employeeid = employees.employeeid
    WHERE employees.department = 'IT'
);

-- Проверка
SELECT projectname, budget, department FROM projects
JOIN employeeprojects 
ON projects.projectid = employeeprojects.projectid
JOIN employees
ON employeeprojects.employeeid = employees.employeeid
WHERE employees.department = 'IT'


-- 3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), 
-- установить EndDate на один год позже его StartDate. 

-- Подготовим подходящий для условия задачи project 
UPDATE projects
SET enddate = null
WHERE projectname = 'Iron Bank of Braavos'

-- Выполним необходимые изменения для EndDate
UPDATE projects
SET enddate = startdate + INTERVAL'1 YEAR'
WHERE enddate IS NULL;

-- Проверим, остались ли проекты с непроставленной датой, если остались - грустно
SELECT * FROM projects
WHERE enddate IS NULL;


-- 4. Вставить нового сотрудника и немедленно назначить его на проект 
-- 'Website Redesign' с 80 отработанными часами, все в рамках одной 
-- транзакции. Использовать предложение RETURNING, чтобы получить 
-- EmployeeID вновь вставленного сотрудника. 
BEGIN;
WITH new_employee AS (
    INSERT INTO employees (firstname, lastname, department, salary)
    VALUES ('Jaime', 'Lannister', 'IT', 90000.00)
    RETURNING employeeid
)

INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
SELECT new_employee.employeeid, projects.projectid, 80
FROM new_employee
JOIN projects 
ON projects.projectname = 'Website Redesign';

COMMIT;

-- Проверка
SELECT firstname, lastname, projectname, hoursworked FROM employees
JOIN employeeprojects 
ON employees.employeeid = employeeprojects.employeeid
JOIN projects
ON employeeprojects.projectid = projects.projectid
WHERE employees.firstname = 'Jaime';


-- Всё! Теперь можно пересматривать ИП))