DROP TABLE IF EXISTS meteorites_temp;
DROP TABLE IF EXISTS meteorites;

-- Import cvs data into temporary file

.import --csv meteorites.csv meteorites_temp

-- Clean table data to specifications

UPDATE "meteorites_temp"
SET "mass" = NULL
    WHERE "mass" = "";

UPDATE "meteorites_temp"
SET "year" = NULL
    WHERE "year" = "";


UPDATE "meteorites_temp"
SET "lat" = NULL
    WHERE "lat" = "";


UPDATE "meteorites_temp"
SET "long" = NULL
    WHERE "long" = "";


UPDATE "meteorites_temp"
SET
    "mass" = ROUND("mass",2),
    "lat" = ROUND("lat",2),
    "long" = ROUND("long",2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = "Relict";

ALTER TABLE "meteorites_temp"
DROP COLUMN "id";

-- Create table to transfer cleaned table into
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT,
    "year" NUMERIC DEFAULT NULL,
    "lat" NUMERIC DEFAULT NULL,
    "long" NUMERIC DEFAULT NULL,
    PRIMARY KEY("id")
);

-- Transfer cleaned data and order by year / name
INSERT INTO "meteorites" ("id","name","class","mass","discovery","year","lat","long")
    SELECT ROW_NUMBER() OVER(
        ORDER BY "year", "name"
        ) AS "id",
        "name",
        "class",
        "mass",
        "discovery",
        "year",
        "lat",
        "long"
    FROM "meteorites_temp";

-- Delete temporary table
DROP TABLE "meteorites_temp";
