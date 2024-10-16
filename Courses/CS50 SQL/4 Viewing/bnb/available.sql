CREATE VIEW "available" AS
    SELECT "l"."id", "l"."property_type", "l"."host_name", "a"."date"
    FROM "availabilities" "a"
    LEFT JOIN "listings" "l" ON "a"."listing_id" = "l"."id"
    WHERE "a"."available" = "TRUE";

--SELECT * FROM "available" WHERE "date" = "2023-12-31";
--SELECT * FROM "available" WHERE "date" = "2023-12-31" AND "property_type" LIKE "%boat%";
wget https://cdn.cs50.net/sql/2024/x/psets/5/snap.zip
