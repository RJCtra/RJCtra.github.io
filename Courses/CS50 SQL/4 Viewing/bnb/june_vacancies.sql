CREATE VIEW "june_vacancies" AS
    SELECT "l"."id", "l"."property_type", "l"."host_name", (SELECT COUNT("a"."available")
    FROM "availabilities") AS "days available in June"
    FROM "listings" "l"
    JOIN "availabilities" "a" ON "a"."listing_id" = "l"."id"
    WHERE "a"."available" = "TRUE" AND "a"."date" >= "2023-06-01" AND "a"."date" <= "2023-06-31"
    GROUP BY "a"."listing_id";



/*
SELECT "listing_id", COUNT(*)
   FROM "availabilities" WHERE "available" = "TRUE" AND "date" >= "2023-06-01" AND "date" <= "2023-06-31"
   GROUP BY "listing_id";
check50 cs50/problems/2024/sql/bnb
