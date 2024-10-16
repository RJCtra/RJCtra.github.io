CREATE VIEW "one_bedrooms" AS
    SELECT "id", "property_type", "host_name", "accommodates" FROM "listings"
    WHERE "bedrooms" = 1;

--SELECT COUNT(*) AS "one bedroom", (SELECT COUNT(*) FROM "one_bedrooms" WHERE "accommodates" > 3) AS "accomodates 4" FROM "one_bedrooms";
