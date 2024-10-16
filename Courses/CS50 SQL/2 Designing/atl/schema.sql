CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_number" INTEGER,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_number") REFERENCES "flights"("flight_number")
);

CREATE TABLE "airlines" (
    "airline" TEXT UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A','B','C','D','E','F','T'))
);

CREATE TABLE "flights" (
    "flight_number" INTEGER,
    "airline" TEXT,
    "departure_airport" TEXT,
    "arrival_airport" TEXT,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    FOREIGN KEY("airline") REFERENCES "airlines"("airline")
);
-- cd "CS50 SQL/2 Designing/atl"
