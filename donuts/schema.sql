CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" IN('Yes','No')),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_history" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_history") REFERENCES "orders"("order_number")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER,
    "customer" TEXT NOT NULL,
    "donuts_in_order" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer") REFERENCES "customers"("id")
);
