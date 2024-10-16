SELECT year, ROUND(AVG(salary),2) from salaries
GROUP BY year ORDER BY year desc;
