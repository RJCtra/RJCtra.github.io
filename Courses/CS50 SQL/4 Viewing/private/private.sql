DROP TABLE IF EXISTS "clue";
DROP VIEW IF EXISTS "message";

CREATE TABLE "clue" (
    "clue_id" INTEGER,
    "start" INTEGER,
    "end" INTEGER,
    PRIMARY KEY("clue_id")
);

INSERT INTO "clue" ("clue_id", "start", "end")
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

SELECT * FROM "clue";

CREATE VIEW "message" AS
SELECT "clue_id", "start", "end", "sentences"."sentence", (SELECT substr("sentence", "start","end")) AS "phrase"
FROM "clue"
JOIN "sentences" ON "clue"."clue_id" = "sentences"."id";

SELECT "phrase" FROM "message";

