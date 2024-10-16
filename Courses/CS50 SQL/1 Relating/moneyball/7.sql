SELECT p.first_name, p.last_name
FROM players p
    JOIN salaries s ON p.id = s.player_id
ORDER BY s.salary DESC
LIMIT 1
;
