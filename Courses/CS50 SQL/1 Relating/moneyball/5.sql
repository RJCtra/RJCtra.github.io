SELECT t.name AS "Teams Satchel Paige Played for"
FROM teams t
    JOIN performances p ON t.id = p.team_id
    JOIN players pl ON pl.id = p.player_id
WHERE pl.first_name = "Satchel" AND pl.last_name = "Paige"
GROUP BY t.name;
