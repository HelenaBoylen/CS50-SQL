-- ------------------------------------------------
-- Schema for RESTO-QUOTE database by Helena Boylen
-- ------------------------------------------------

-- Creates the table for Customers and their contact info
CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Creates the table for Workshops, their contact info and location
CREATE TABLE "workshops" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

-- Creates the table for Vehicles, their information and owner
CREATE TABLE "vehicles" (
    "id" INTEGER,
    "reg" TEXT NOT NULL UNIQUE,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Creates the table for Jobs required for the vehicles and links to the owner
CREATE TABLE "jobs" (
    "id" INTEGER,
    "vehicle_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "job_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Creates the table for quotations from the workshop to the customer referencing the vehicle and job
CREATE TABLE "quotes" (
    "id" INTEGER,
    "vehicle_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "workshop_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,
    "quote" TEXT NOT NULL,
    "duration" TEXT NOT NULL,
    "date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id"),
    FOREIGN KEY("workshop_id") REFERENCES "workshops"("id"),
    FOREIGN KEY("job_id") REFERENCES "jobs"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Creates a table to store info from a comments section relating to vehicles and jobs from customers and workshops.
CREATE TABLE "comments" (
    "id" INTEGER,
    "vehicle_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "workshop_id" INTEGER NOT NULL,
    "job_id" INTEGER NOT NULL,
    "text" TEXT NOT NULL,
    "date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("id"),
    FOREIGN KEY("workshop_id") REFERENCES "workshops"("id"),
    FOREIGN KEY("job_id") REFERENCES "jobs"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Create INDEXES to speed up popular searches
CREATE INDEX "workshop_index" ON "workshops"("name", "location", "website");
CREATE INDEX "vehicle_make_index" ON "vehicles"("make", "model");
CREATE INDEX "jobs_index" ON "jobs"("name", "job_date");

-- Create VIEWS to display useful combinations of table data

-- A VIEW of workshops, their locations and website grouped by location to enable customers to browse possible workshops nearby
CREATE VIEW "workshop_locations" AS
SELECT "name" AS "company name", "location", "website"
FROM "workshops"
GROUP BY "location";

-- Create a VIEW to list available jobs in date order newest first.
CREATE VIEW "new_jobs" AS
SELECT "jobs"."job_date" AS "date", "vehicles"."make", "vehicles"."model", "jobs"."name", "jobs"."description"
FROM "jobs"
JOIN "vehicles" ON "vehicles"."id" = "jobs"."vehicle_id"
ORDER BY "jobs"."job_date" DESC;



