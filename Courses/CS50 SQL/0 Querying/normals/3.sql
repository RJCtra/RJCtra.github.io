SELECT "0m", "100m", "200m" FROM normals
WHERE latitude = -41.5 AND longitude = 174.5;
SELECT AVG("0m"), AVG("100m"), AVG("200m") FROM normals
WHERE latitude BETWEEN -48 AND -32 AND longitude BETWEEN 163 AND 179;
