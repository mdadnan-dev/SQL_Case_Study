

-- Q1. List all the employee details

select * from employee

-- Q2. List all the department details.

select * from department

-- Q3. List all job details

select * from job

-- Q4. List all the locations

select * from location

-- Q5. List out the First Name, Last Name, Salary, Commission for all Employees

select First_Name, Last_Name, Salary, Comm  from employee

-- Q6. List out the Employee ID, Last Name, Department ID for all employees and alias 
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id"

select Employee_ID as 'ID of the Employee', Last_Name as 'Name of the Employee', Department_ID as 'Dep_id'
from employee

-- Q7. List out the annual salary of the employees with their names only

select First_Name, Last_Name, Salary/12 as 'annual salary' from employee

-- Q8. List the details about "Smith"

select * from employee
where First_Name ='Smith' or Last_Name = 'Smith'

-- Q9. List out the employees who are working in department 20

select * from employee 
where Department_ID = 20

-- Q10. List out the employees who are earning salary between 2000 and 3000.

select * from employee
where salary between 2000 and 3000


-- Q11. List out the employees who are working in department 10 or 20

select * from employee 
where Department_ID in (10,20)


-- Q12. Find out the employees who are not working in department 10 or 30.

select * from employee
where Department_ID not in (10,30)

-- Q13. List out the employees whose name starts with 'L'. 

select * from employee 
where First_Name like 'L%' or Last_Name like 'L%'


-- Q14. List out the employees whose name starts with 'L' and ends with 'E'.

select * from employee
where First_Name like 'L%E' or Last_Name like 'L%E'


-- Q15. List out the employees whose name length is 4 and start with 'J'. 

select * from employee
where ( len(First_Name) = 4 and First_Name like 'J%' )  or  ( len(Last_Name) = 4 and Last_Name like 'J%')


-- Q16. List out the employees who are working in department 30 and draw the salaries more than 2500. 

select * from employee
where Department_ID = 30 and salary > 2500 

-- Q17. List out the employees who are not receiving commission. 

select * from employee
where Comm is Null



-- Q18. List out the Employee ID and Last Name in ascending order based on the Employee ID.

select Employee_ID, Last_Name from employee
order by Employee_ID

-- Q19. List out the Employee ID and Name in descending order based on salary.

select Employee_ID, First_Name,Last_Name from employee
order by Salary

-- Q20. List out the employee details according to their Last Name in ascending-order

select * from employee
order by Last_Name 

-- Q21. List out the employee details according to their Last Name in ascending order and then Department ID in descending order

select * from employee
order by Last_Name, Department_ID desc

-- Q22. List out the department wise maximum salary, minimum salary and average salary of the employees

select  Department_ID, max(Salary) as 'Max_Sal', min(Salary) as 'Min Sal', avg(Salary) as Avg_Sal
from employee
group by Department_ID

-- Q23. List out the job wise maximum salary, minimum salary and average salary of the employees

select j.Job_ID,j.Designation,max(Salary) as Max_Sal, min(Salary) as Min_Sal, avg(Salary)as Avg_Sal 
from employee e join job j on e.Job_ID = j.Job_ID
group by j.Job_ID, j.Designation

-- Q24. List out the number of employees who joined each month in ascending order

select count(Employee_ID) as 'Number of Employees that joined each month',Hire_Date from employee
group by Hire_Date
order by Hire_Date

-- Q25. List out the number of employees for each month and year in ascending order based on the year and month.

select count(*) as Number_Of_Employees ,month(Hire_Date) as Month_Hire_Date,year(Hire_Date) as Year_Hire_Date
from employee
group by month(Hire_Date),year(Hire_Date)
order by month(Hire_Date),year(Hire_Date)


-- Q26. List out the Department ID having at least four employees

select Department_ID  from employee
group by Department_ID
having  count(Department_ID) >= 4


-- Q27. How many employees joined in February month

select count(*) as 'Number of Employees Joined in the month of Feb' from employee
where Month(Hire_Date) = 02  

-- Q28. How many employees joined in May or June month

select count(*) as 'Number of Employees Joined', month(Hire_Date) as 'Month'
from employee
group by Hire_Date
having month(Hire_Date) in (05,06)


-- Q29. How many employees joined in 1985

select count(*) as 'Total Employees', Year(Hire_Date) as 'Year'
from employee
group by Year(Hire_Date)
having Year(Hire_Date) = 1985

-- Q30. How many employees joined each month in 1985

select count(*) as 'total Employees', month(Hire_Date) as 'Month', year(Hire_Date) as 'Year'
from employee
group by Month(Hire_Date), Year(Hire_Date)
having Year(Hire_Date) = 1985

-- Q31. How many employees were joined in April 1985

select count(*) as 'Total Employee', month(Hire_Date) as 'Month', Year(Hire_Date) as 'Year' 
from employee
group by  month(Hire_Date), Year(Hire_Date)
having Month(Hire_Date) = 04 and Year(Hire_Date) = 1985 

-- Q32. Which is the Department ID having greater than or equal to 3 employees joining in April 1985

select Department_ID,count(*) as 'Total Employees', Month(Hire_Date) as 'Month', Year(Hire_Date) as 'Year'
from employee
group by Department_ID,  Month(Hire_Date), Year(Hire_Date)
having Month(Hire_Date) = 04 and Year(Hire_Date) = 1985 and count(*) >= 3



-- Q33. List out employees with their department names

select First_Name,Last_Name,d.Name 
from Employee e 
join Department d on e.Department_ID = d.Department_ID


-- Q34. Display employees with their designations

select * 
from employee e 
join Job j on e.Job_ID = j.Job_ID


-- Q35. Display the employees with their department names and city

select e.First_Name, e.Last_Name, d.Department_ID,d.Name, l.Location_ID, l.City
from employee e
join department d on e.Department_ID = d.Department_ID
join location l on d.Location_ID = l.Location_ID


-- Q36. How many employees are working in different departments? Display with department names

select count(*) as 'Total Employee',d.Department_ID,d.Name
from employee e
join department d on e.Department_ID = d.Department_ID
group by d.Department_ID, d.Name


-- Q37. How many employees are working in the sales department

select count(*) as 'Total Employee',d.Department_ID,d.Name
from employee e 
join department d on e.Department_ID = d.Department_ID
group by d.Department_ID,d.Name
having d.Name = 'Sales'

-- Q38. Which is the department having greater than or equal to 3 employees and 
-- display the department names in ascending order

select count(*) as 'Total Employee',d.Name
from employee e
join department d on e.Department_ID = d.Department_ID
group by D.name
having count(*) >= 3
order by d.Name 

-- Q39. How many employees are working in 'Dallas'

select count(*) as 'Total Employees',l.City
from employee e
join department d on e.Department_ID = d.Department_ID
join Location l on d.Location_ID = l.Location_ID
group by l.City
having l.city = 'Dallas'

-- Q40. Display all employees in sales or operation departments

select * 
from employee e 
join department d on e.Department_ID = d.Department_ID
where d.Name in ('Sales','Operations')

-- Q41. Display the employee details with salary grades. Use conditional statement to create a grade column

select *, iif(Salary>2000,'Grade-A',iif(Salary<2000 and Salary > 1000,'Grade-B','Grade-C')) as Grade_Column
from employee


-- Q42. List out the number of employees grade wise. Use conditional statement to create a grade column

select iif(Salary>2000,'Grade-A',iif(Salary<2000 and Salary > 1000,'Grade-B','Grade-C')) as Grade_Column,
count(*) as Total_Employee
from employee
group by iif(Salary>2000,'Grade-A',iif(Salary<2000 and Salary > 1000,'Grade-B','Grade-C'))


-- Q43. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary

select *,iif(Salary>2000,'Grade-A',iif(Salary<2000 and Salary>1000,'Grade-B','Grade-C' )) as Grade_Column
from employee
where Salary between 2000 and 5000

-- Q44. Display the employees list who got the maximum salary

select * from employee
where salary =
(select max(salary)
from employee)

-- Q45. Display the employees who are working in the sales department

select * from employee
where Job_ID =(
select Job_ID from job 
where Designation = 'Sales_Person')


-- Q46. Display the employees who are working as 'Clerk'

select * from employee
where Job_ID = (
select Job_ID from Job 
where Designation = 'Clerk'
)



-- Q47. Display the list of employees who are living in 'Boston'

select * from employee
where Department_ID = ( 
select Department_ID from Department
where Location_ID = (select Location_ID from location
where City = 'Boston'
))


-- Q48. Find out the number of employees working in the sales department

select count(*) as 'Total Employees' from employee
where Job_ID = (
select Job_ID from Job 
where Designation = 'Sales_Person'
)


-- Q49. Update the salaries of employees who are working as clerks on the basis of 10%.

update employee 
set salary = Salary + (Salary * 0.1)
where Job_ID=(
select Job_ID from Department 
where Name = 'Clerk' )


-- Q50. Display the second highest salary drawing employee details

select * from employee
where salary = (
select max(salary) from employee
where salary <
(
select max(salary) from employee
))


-- Q51. List out the employees who earn more than every employee in department 30

select * from employee
where Salary >all (
select Salary from employee 
where Department_ID = 30)

-- Q52. Find out which department has no employees

select d.Department_ID,Name from Department d 
left outer join employee e on e.Department_ID = d.Department_ID
where e.Department_Id is Null

-- Q53. Find out the employees who earn greater than the average salary for their department

 select * from employee  e1
 where salary>
 (select avg(Salary) from employee e2
 where Department_ID = e1.DEPARTMENT_ID
 group by Department_ID)


