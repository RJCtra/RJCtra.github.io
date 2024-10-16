CREATE TABLE "users" (
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("username")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year_founded" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "people_connections" (
    "user_1" TEXT,
    "user_2" TEXT,
    FOREIGN KEY("user_1") REFERENCES "users"("username"),
    FOREIGN KEY("user_2") REFERENCES "users"("username")
);

CREATE TABLE "school_connections" (
    "username" TEXT,
    "school" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    FOREIGN KEY("username") REFERENCES "users"("username"),
    FOREIGN KEY("school") REFERENCES "schools"("id")
);

CREATE TABLE "company_connections" (
    "username" TEXT,
    "company_id" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title_held" TEXT,
    FOREIGN KEY("username") REFERENCES "users"("username"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
)

