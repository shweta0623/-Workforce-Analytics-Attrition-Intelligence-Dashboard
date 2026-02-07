

select * from [dbo].[employee_attrition]

-- check total records
select count(*) as Total_employees from employee_attrition

--check duplicates
select EmployeeNumber, count(*) from employee_attrition
group by EmployeeNumber
Having count(*) > 1

--validate attrition value
select Attrition, COUNT(*) from employee_attrition
group by Attrition

--missing value
select 
	SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 End) as income_null,
	SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 End) as JobRole_null
from employee_attrition

--altering education col

ALTER TABLE employee_attrition 
ADD EducationLevel VARCHAR(20);

Update employee_attrition
Set EducationLevel = 
	CASE Education
		WHEN 1 THEN 'Below College'
		WHEN 2 THEN 'College'
		WHEN 3 THEN 'Bachelor'
		WHEN 4 THEN 'Master'
		WHEN 5 THEN 'Doctor'
		END;
select Education, EducationLevel, count(*) from employee_attrition
group by  Education, EducationLevel

--employees who left the company
select count(*) as attritted_employees 
from employee_attrition
where Attrition = 'Yes';


--Attrition Rate by Department
select Department, Avg(AttritionFlag) as Attrition_Rate
from employee_attrition
group by Department


--employee count by department
select Department, COUNT(EmployeeNumber) as Employees
from employee_attrition
group by Department

-- overtime by hourly Rate
select OverTime, Avg(HourlyRate) as Avg_hour_rate 
from employee_attrition
group by OverTime