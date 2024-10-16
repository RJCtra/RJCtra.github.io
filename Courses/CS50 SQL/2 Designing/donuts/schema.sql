CREATE TABLE "ingredients" (
    "ingredient_id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" DECIMAL(10,2) NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY("ingredient_id")
);

CREATE TABLE "donuts" (
    "donut_id" INTEGER,
    "name" TEXT NOT NULL,
    "is_gluten_free" INTEGER CHECK("is_gluten_free" IN (0, 1)),
    "price_per_donut" DECIMAL(10,2) NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    PRIMARY KEY("donut_id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("ingredient_id")
);

CREATE TABLE "donut_recipe" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    "quantity" DECIMAL,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("donut_id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("ingredient_id")
);

CREATE TABLE "orders" (
    "order_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("order_id")
);

CREATE TABLE "donut_ordered" (
    "id" INTEGER,
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("order_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("donut_id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
);

CREATE TABLE "customers" (
    "customer_id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("customer_id")
);

CREATE TABLE "customer_history" (
    "customer_id" INTEGER,
    "order_id" INTEGER,
    PRIMARY KEY("customer_id","order_id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("order_id")
)
