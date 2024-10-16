SELECT t.name AS "Team Name", SUM(p.H) AS "Total Hits"
FROM teams t
    JOIN performances p ON t.id = p.team_id
WHERE p.year = 2001
GROUP BY t.name
ORDER BY "Total Hits" DESC
LIMIT 5;
