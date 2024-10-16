CREATE TABLE "collections" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "created" (
    "artist_id" INTEGER,
    "collection_id" INTEGER,
    PRIMARY KEY("artist_id", "collection_id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE, -- cascade allows for deletion to cascade onto this table
    FOREIGN KEY("collection_id") REFERENCES "collections"("id") ON DELETE CASCADE
);

CREATE TABLE "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY("id")
);

CREATE TRIGGER "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", "bought");
END;
