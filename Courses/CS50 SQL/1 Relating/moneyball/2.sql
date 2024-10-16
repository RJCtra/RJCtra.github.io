SELECT year, (salary) from salaries
WHERE player_id = (SELECT id FROM players WHERE first_name = "Cal" AND last_name = "Ripken")
ORDER BY year desc;
