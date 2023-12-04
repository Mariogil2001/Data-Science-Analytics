/*
Trends in Startups

Howdy! It’s your first day as a TechCrunch reporter. Your first task is to write an article on the rising trends in the startup world.

To get you started with your research, your boss emailed you a startup_database.sql file that contains a table called startups. It is a portfolio of some of the biggest names in the industry.

Write queries with aggregate functions to retrieve some interesting insights about these companies.
*/
-- Take a look at the startups table
select *
from startups;

-- Calculate the total numer of companies in the table.
select count(*)
from startups;

/*
We want to know the total value of all companies in this table.
Calculate this by getting the SUM() of the valuation column.
*/
SELECT printf('$%.2f', SUM(valuation)) AS Total_Value
FROM startups;

/*
What is the highest amount raised by a startup?
Return the maximum amount of money raised.
*/
SELECT printf('$%.2f',MAX(raised)) as Highest_Amount_Raised
from startups;

/*
Edit the query so that it returns the maximum
amount of money raised, during ‘Seed’ stage
*/
SELECT printf('$%.2f',MAX(raised)) as Highest_Amount_Raised_During_Stage
from startups
where stage='Seed';

/*
In what year was the oldest company on the list founded?
*/
SELECT min(founded) AS 'Oldest Company'
FROM startups;

/*Return the average valuation.*/
SELECT printf('$%.2f',AVG(valuation)) AS 'Average Valuation'
FROM startups;

/*Return the average valuation, in each category.*/
SELECT category, printf('$%.2f',AVG(valuation)) AS 'Average Valuation by Category'
FROM startups
GROUP BY category;

/*
Return the average valuation, in each category.
Round the averages to two decimal places.
*/
SELECT category, ROUND(AVG(valuation), 2) AS 'Average Valuation by Category'
FROM startups
GROUP BY category;

/*
Return the average valuation, in each category.
Round the averages to two decimal places.
Lastly, order the list from highest averages to lowest.
*/
SELECT category, ROUND(AVG(valuation), 2) AS 'Average Valuation by Category'
FROM startups
GROUP BY category
ORDER BY AVG(valuation) DESC;

/*
First, return the name of each category with the total
number of companies that belong to it.
*/
SELECT category, count(*)
FROM startups
GROUP BY category;

/*
Next, filter the result to only include categories that have more than three companies in them.
What are the most competitive markets?
*/
SELECT category, count(*) AS Total_in_category
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

/*
What is the average size of a startup in each location?
*/
SELECT location, round(avg(employees),2) as AVG_Employees
from startups
GROUP BY location;

/*
What is the average size of a startup in each location, with average sizes above 500?
*/
SELECT location, round(avg(employees),2) as AVG_Employees
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;