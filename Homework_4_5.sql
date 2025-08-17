-- Задание 5: Функции и представления 


-- 1. Функция: Создать функцию PostgreSQL с именем 
-- CalculateAnnualBonus, которая принимает employee_id и 
-- Salary  в качестве входных данных и возвращает рассчитанную 
-- сумму бонуса (10 % от Salary) для этого сотрудника. Используйте 
-- PL/pgSQL для тела функции.
CREATE OR REPLACE FUNCTION CalculateAnnualBonus(employee_id INT, Salary NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN Salary * 0.10;
END;
$$;
	

--2. Использовать эту функцию в операторе SELECT, чтобы увидеть 
-- потенциальный бонус для каждого сотрудника. 
SELECT CalculateAnnualBonus(employeeid, salary)
FROM employees
WHERE employeeid = 3;


-- 3. Представление (View): Создать представление с именем 
-- IT_Department_View, которое показывает EmployeeID, 
-- FirstName, LastName и Salary только для сотрудников из отдела 'IT'. 
CREATE OR REPLACE VIEW IT_Department_View AS
SELECT employeeid, firstname, lastname, salary
FROM employees
WHERE department LIKE '%IT';


-- 4. Выбрать данные из вашего представления IT_Department_View. 
SELECT * FROM IT_Department_View;
