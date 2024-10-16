SELECT p.first_name, p.last_name, s.salary
FROM salaries s
    JOIN players p ON s.player_id = p.id
WHERE s.year = 2001
ORDER BY s.salary ASC, p.first_name ASC, p.last_name ASC, p.id ASC
LIMIT 50;
