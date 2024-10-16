SELECT city, COUNT(city) AS "Number of Schools"
FROM (
    SELECT city
    FROM schools
    WHERE type="Public School"
)
GROUP BY city
ORDER BY "Number of Schools" DESC, city ASC
LIMIT 10;
