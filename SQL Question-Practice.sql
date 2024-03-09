-- 1. Retrieve the total number of employees in the dataset.
SELECT DISTINCT(count(*)) FROM employee_survey_data;

-- 2. List all unique job roles in the dataset.
SELECT DISTINCT(JobRole) FROM `general data`;

-- 3. Find the average age of employees.
SELECT AVG(Age) FROM `general data`;

-- 4. Retrieve the names and ages of employees who have worked at the company for more than 5 years.
SELECT `ï»¿Emp Name`, Age FROM `general data` WHERE TotalWorkingYears > 5;

-- 5. Get a count of employees grouped by their department.
SELECT Department, COUNT(`ï»¿Emp Name`) FROM `general data` GROUP BY Department;

-- 6. List employees who have 'High' Job Satisfaction.
SELECT `ï»¿Emp Name` FROM `general data` 
INNER JOIN employee_survey_data ON `general data`.EmployeeID = employee_survey_data.EmployeeID
WHERE employee_survey_data.JobSatisfaction = 4;

-- 7. Find the highest Monthly Income in the dataset.
SELECT MonthlyIncome FROM `general data` ORDER BY MonthlyIncome DESC LIMIT 1;

-- 8. List employees who have 'Travel_Rarely' as their BusinessTravel type.
SELECT `ï»¿Emp Name` AS Travel_Rarely_Employee FROM `general data` WHERE BusinessTravel = "Travel_Rarely";

-- 9. Retrieve the distinct MaritalStatus categories in the dataset.
SELECT DISTINCT(MaritalStatus) FROM `general data`;

-- 10. Get a list of employees with more than 2 years of work experience but less than 4 years in their current role.
SELECT `ï»¿Emp Name` AS Emp_with_2_Year_Exp FROM `general data` WHERE YearsAtCompany > 2 AND YearsAtCompany < 4;

-- 11. List employees who have changed their job roles within the company (JobLevel and JobRole differ from their previous job).


-- 12. Find the average distance from home for employees in each department.
SELECT Department, AVG(DistanceFromHome) AS Average_Distance FROM `general data` GROUP BY Department;

--  13. Retrieve the top 5 employees with the highest MonthlyIncome.
SELECT `ï»¿Emp Name`, MonthlyIncome FROM `general data` ORDER BY MonthlyIncome DESC LIMIT 5;

-- 14. Calculate the percentage of employees who have had a promotion in the last year.
SELECT (COUNT(CASE WHEN YearsSinceLastPromotion = 1 THEN 1 END)/COUNT(*))*100 AS percentage_promoted FROM `general data`;

-- 15. List the employees with the highest and lowest EnvironmentSatisfaction.
SELECT `ï»¿Emp Name` AS Empployee_Name_with_highest_satisfaction FROM `general data` 
JOIN employee_survey_data ON `general data`.EmployeeID = employee_survey_data.EmployeeID
WHERE employee_survey_data.EnvironmentSatisfaction = 4; 

SELECT `ï»¿Emp Name` AS Employee_Name_with_lowest_satisfaction FROM `general data` 
JOIN employee_survey_data ON `general data`.EmployeeID = employee_survey_data.EmployeeID
WHERE employee_survey_data.EnvironmentSatisfaction = 1; 

-- 16. Find the employees who have the same JobRole and MaritalStatus.
SELECT g1.EmployeeID, g1.`ï»¿Emp Name`, g1.JobRole, g1.MaritalStatus FROM `general data` g1
JOIN `general data` g2 ON g1.JobRole = g2.JobRole AND g1.MaritalStatus = g2.MaritalStatus
WHERE g1.EmployeeID <> g2.EmployeeID;

-- 17. List the employees with the highest TotalWorkingYears who also have a PerformanceRating of 4.
SELECT `ï»¿Emp Name` AS Employee_Name, TotalWorkingYears, manager_survey_data.PerformanceRating AS Rating FROM `general data`
JOIN manager_survey_data ON `general data`.EmployeeID = manager_survey_data.EmployeeID WHERE manager_survey_data.PerformanceRating = 4
ORDER BY TotalWorkingYears DESC;

-- 18. Calculate the average Age and JobSatisfaction for each BusinessTravel type
SELECT BusinessTravel, AVG(Age) AS Average_age, AVG(employee_survey_data.JobSatisfaction) AS Satisfaction FROM `general data`
JOIN employee_survey_data ON `general data`.EmployeeID = employee_survey_data.EmployeeID WHERE employee_survey_data.JobSatisfaction
GROUP BY BusinessTravel;

-- 19. Retrieve the most common EducationField among employees.
SELECT EducationField, count(EducationField) as Count FROM `general data`GROUP BY `general data`.EducationField ORDER BY count(EducationField) DESC LIMIT 1;

-- 20. List the employees who have worked for the company the longest but haven't had a promotion.
SELECT `ï»¿Emp Name` AS Employee_Name, TotalWorkingYears, YearsSinceLastPromotion AS Promotion_Year FROM `general data`
WHERE `general data`.YearsSinceLastPromotion = 0
ORDER BY TotalWorkingYears DESC;