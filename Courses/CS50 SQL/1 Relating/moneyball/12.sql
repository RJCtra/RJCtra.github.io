WITH
    per_hit AS (
        SELECT p.first_name, p.last_name, s.salary, p.id AS id, s.salary / per.H AS salary_per
        FROM players p
            JOIN salaries s ON p.id = s.player_id
            JOIN performances per ON p.id = per.player_id
            AND s.year = per.year
        WHERE per.year = 2001 AND per.H > 0
        ORDER BY salary_per
        LIMIT 100
    ),
    per_RBI AS(
        SELECT p.first_name, p.last_name, s.salary, p.id AS id, s.salary / per.RBI AS salary_per
        FROM players p
            JOIN salaries s ON p.id = s.player_id
            JOIN performances per ON p.id = per.player_id
            AND s.year = per.year
        WHERE per.year = 2001 AND per.RBI >0 
        ORDER BY salary_per
        LIMIT 100
    ), list AS (
        SELECT first_name, last_name, salary_per, id FROM per_hit
        UNION
        SELECT first_name, last_name, salary_per, id FROM per_RBI
        ORDER BY salary_per ASC
        LIMIT 10
    )
SELECT DISTINCT list.first_name, list.last_name, list.salary_per
FROM list
ORDER BY list.id ASC;
    /*
SELECT list.first_name, list.last_name, list.salary_per
FROM list
    JOIN per_hit ON list.id = per_hit.id
    JOIN per_RBI ON list.id = per_RBI.id
WHERE list.id = per_hit.id AND list.id = per_RBI.id
ORDER BY list.id ASC
;
