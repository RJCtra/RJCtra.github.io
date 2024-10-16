SELECT pl.first_name, pl.last_name, s.salary, per.HR, per.year --COUNT(pl.first_name)
FROM players pl
    JOIN salaries s ON pl.id = s.player_id
    JOIN performances per ON pl.id = per.player_id
    AND s.year = per.year
ORDER BY pl.id ASC, per.year DESC, per.HR DESC, s.salary DESC;
