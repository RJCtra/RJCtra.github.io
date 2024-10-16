/*CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT, --could be NOT NULL, but not entirely necessary, would depend if we wanted to give riders the option of mandatory name entry or not
    PRIMARY KEY("id")
); */

CREATE TABLE "cards" (
    "id" INTEGER,
    PRIMARY KEY("id")
)

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE, -- each station has to have a unique name
    "line" TEXT NOT NULL, -- line name likely to be used more than once
    PRIMARY KEY("id")
);

CREATE TABLE "swipes" (
    "id" INTEGER,
    "card_id" INTEGER,
    "station_id" INTEGER,
    "type" TEXT NOT NULL CHECK("type" IN ('enter', 'exit', 'deposit')),
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" NUMERIC NOT NULL CHECK("amount" != 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("card_id") REFERENCES "cards"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);

/*
CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER,
    FOREIGN KEY("rider_id") REFERENCES "riders"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);
*/

