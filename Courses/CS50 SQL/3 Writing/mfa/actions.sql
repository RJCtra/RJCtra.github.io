/* USED
INSERT INTO "collections" ("id","title","accession_number","acquired")
VALUES (2, "Farmers working at dawn", "11.6152", "1911-09-03");



INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ("Spring outing", "14.76", "1914-01-08");



.import --csv --skip 1 mfa.csv collections

*/

-- SELECT * FROM collections;

-- DELETE FROM "collections" WHERE title = "Spring outing";

-- DELETE FROM "collections" WHERE acquired IS NULL;

-- DELETE FROM "collections" WHERE acquired < 1909-01-01;

-- .import --csv --skip 1 mfa.csv collections
-- .import --csv mfa.csv temp
/*
INSERT INTO "collections" ("title", "accession_number", "acquired")
SELECT "title", "accession_number", "acquired" FROM "temp";
*/
-- DROP TABLE "temp";
/* Adding artists to artist table
INSERT INTO "artists" ("name")
VALUES ("Li Yin");
INSERT INTO "artists" ("name")
VALUES ("Qian Weicheng");
INSERT INTO "artists" ("name")
VALUES ("Unidentified Artist");
INSERT INTO "artists" ("name")
VALUES ("Zhou Chen");
*/
/* Adding created values to link artists to works
INSERT INTO "created" ("artist_id", "collection_id")
VALUES (1,4);
INSERT INTO "created" ("artist_id", "collection_id")
VALUES (2,1);
INSERT INTO "created" ("artist_id", "collection_id")
VALUES (3,2);
INSERT INTO "created" ("artist_id", "collection_id")
VALUES (4,3);
*/

-- DELETE FROM "artists" WHERE "artist_id" = 3  -- deleting artist with ID 3 assuming we know ID
/* -- delete using a subquery to obtain the artist_id
DELETE FROM "created" WHERE "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = "Unidentified Artist"
);
*/
/*
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = "Li Yin"
    )
    WHERE "collection_id" = (
        SELECT "id" FROM "collections"
        WHERE "title" = "Farmers working at dawn"
    );

SELECT * FROM "created";

*/

/* For Votes COUNT and UPDATE to correct errors

SELECT "title", COUNT("title") FROM "votes" GROUP BY "title";)
UPDATE "votes" SET "title" = trim("title"); will update the titles to remove leading or trailing empty spaces
UPDATE "votes" SET "title" = uppper("title"); will force all titles to upper case to remove inconsistencies
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN' WHERE "title" LIKE 'FA%'; -- will update any which have Fa at beginning w/ wildcard ending to desired title
UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE' WHERE "title" LIKE 'IMAGINATIVE%';
*/

/* TRIGGERS */
/*
CREATE TRIGGER name
BEFORE -- or AFTER
-- DELETE ON table / UPDATE OF column ON table / INSERT ON table
FOR EACH ROW -- if multiple rows actioned on, should run TRIGGER on each row
BEGIN
    ...;
END
*/
-- ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;
-- UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';
SELECT * FROM "collections" WHERE "deleted" <> 1;
SELECT * FROM "collections" WHERE "deleted" = 1;
