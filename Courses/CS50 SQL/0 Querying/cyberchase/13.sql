SELECT id, title, topic FROM episodes
WHERE episode_in_season BETWEEN 1 AND 5 AND topic LIKE '%Area%' OR topic LIKE '%Logic%';
