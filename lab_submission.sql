-- (i) A Procedure called PROC_LAB5

-- Create the procedure to retrieve and process data
DELIMITER $$
CREATE PROCEDURE PROC_LAB5()
BEGIN
    SELECT e.firstName, e.lastName, o.city, o.country, es.employees_salary_amount
    FROM employees e
    JOIN offices o ON e.officeCode = o.officeCode
    JOIN employees_salary es ON e.employeeNumber = es.employeeNumber
    WHERE es.employees_salary_amount > 20000;
END $$
DELIMITER ;

-- (ii) A Function called FUNC_LAB5

-- Create the function to calculate total salary for a specific office
DELIMITER $$
CREATE FUNCTION FUNC_LAB5(officeCodeInput INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE totalSalary DECIMAL(10,2);
    
    SELECT SUM(es.employees_salary_amount) INTO totalSalary
    FROM employees_salary es
    JOIN employees e ON es.employeeNumber = e.employeeNumber
    WHERE e.officeCode = officeCodeInput;
    
    RETURN totalSalary;
END $$
DELIMITER ;

-- (iii) A View called VIEW_LAB5

-- Create the view to display employee details along with their salaries
CREATE VIEW VIEW_LAB5 AS
SELECT e.employeeNumber, e.firstName, e.lastName, o.city, o.country, es.employees_salary_amount
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
JOIN employees_salary es ON e.employeeNumber = es.employeeNumber;