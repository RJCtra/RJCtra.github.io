SELECT s.name AS "school_name", e.per_pupil_expenditure, g.graduated
FROM schools s
    JOIN graduation_rates g ON g.school_id = s.id
    JOIN expenditures e ON e.district_id = s.district_id
ORDER BY e.per_pupil_expenditure DESC, s.name ASC;
