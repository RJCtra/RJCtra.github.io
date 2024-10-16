CREATE VIEW "frequently_reviewed" AS
SELECT "l"."id", "l"."property_type", "l"."host_name", COUNT("r"."id") AS "review count" FROM "listings" "l"
    INNER JOIN "reviews" "r" ON "l"."id" = "r"."listing_id"
GROUP BY "l"."id"
ORDER BY "review count" DESC, "l"."property_type" ASC, "l"."host_name" ASC
LIMIT 100;


--SELECT * FROM "frequently_reviewed" LIMIT 1;
