SELECT pl.first_name, pl.last_name, s.salary / per.H AS "dollars per hit"
FROM players pl
    JOIN salaries s ON pl.id = s.player_id
    JOIN performances per ON pl.id = per.player_id
    AND s.year = per.year
WHERE s.year = 2001 AND per.H <> 0
ORDER BY "dollars per hit" ASC, pl.first_name ASC, pl.last_name ASC
LIMIT 10;
