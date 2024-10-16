SELECT english_title AS title, brightness, contrast FROM views
WHERE brightness BETWEEN 0.50 AND 0.60 AND contrast BETWEEN 0.50 AND 0.60
ORDER BY brightness DESC, contrast ASC;
