-- ----------------------
-- Displaying Information
-- ----------------------

-- Find all vehicles owned by specific customer "Joe Bloggs"
SELECT "reg", "make", "model", "year"
FROM "vehicles"
WHERE "customer_id" IN (
    SELECT "id"
    FROM "customers"
    WHERE "first_name" = 'Joe'
    AND "last_name" = 'Bloggs'
);

-- Find all Jobs submitted for quotes on vehicles with the make "Land Rover"
SELECT "job_date", "name", "description"
FROM "jobs"
WHERE "vehicle_id" IN (
    SELECT "id"
    FROM "vehicles"
    WHERE "make" = 'Land Rover'
    ORDER BY "job_date"
);

-- Find all Jobs submitted this year
SELECT "job_date", "name", "description"
FROM "jobs"
WHERE "job_date" >= '2024-01-01';


-- Find all quotes submitted for vehicles owned by "Joe Bloggs"
SELECT "quote", "duration", "quote_date"
FROM "quotes"
WHERE "customer_id" IN (
    SELECT "id"
    FROM "customers"
    WHERE "first_name" = 'Joe'
    AND "last_name" = 'Bloggs'
);

-- Display workshops grouped by location and ordered by name
SELECT "name", "location", "email", "website"
FROM "workshops"
GROUP BY "location"
ORDER BY "name";

-- Display all comments submitted regarding customer "Joe Bloggs"
SELECT "comments"."text", "comments"."date" FROM "comments"
JOIN "customers" ON "comments"."customer_id" = "customers"."id"
WHERE "customers"."first_name" = 'Joe'
AND "customers"."last_name" = 'Bloggs'
ORDER BY "comments"."date" DESC;

-- -----------------------
-- INSERTING DATA
-- -----------------------

-- Add new Customer
INSERT INTO "customers" ("first_name", "last_name", "email", "username", "password")
VALUES ('Joe', 'Bloggs', 'joebloggs@gmail.com', 'joebloggs1', 'bloggsjoe');

-- Add new Vehicle
INSERT INTO "vehicles" ("reg", "make", "model", "year", "customer_id")
VALUES ('DYP 622J', 'Austin', 'Mini', '1972', '6');

-- Add new Job
INSERT INTO "jobs" ("vehicle_id", "customer_id", "job_date", "name", "description")
VALUES ('32', '6', '2024-03-12', 'Respray', 'Total exterior respray including fixing dents and filling holes');

-- Add new Quote
INSERT INTO "quotes" ("vehicle_id", "customer_id", "workshop_id", "job_id", "quote", "duration", "date")
VALUES ('1', '2', '2', '1', '£2,500', '2 weeks');

-- Add new Comment
INSERT INTO "comment" ("vehicle_id", "customer_id", "workshop_id", "job_id", "text", "date")
VALUES ('32', '6', '15', '85', 'I am happy to accept your quote', '2024-03-12');

-- ------------------------
-- DELETING
-- ------------------------

-- Delete Customer
DELETE FROM "customers"
WHERE "id" = '1';

-- Delete Workshop
DELETE FROM "workshops"
WHERE "id" = '1';

-- Delete Comment
DELETE FROM "comments"
WHERE "id" = '1';

-- Delete job
DELETE FROM "jobs"
WHERE "job_id" = '85';

-- Delete vehicles owned by "Joe Bloggs"
DELETE FROM "vehicles"
WHERE "customer_id" = '6';

-- ------------------------
-- UPDATING
-- ------------------------

-- Update Workshop info
UPDATE "workshops"
SET "location" = 'Derby'
WHERE "id" = '2';

-- Update Customer info
UPDATE "customers"
SET "email" = 'jbloggs@gmail.com'
WHERE "id" = '1';

-- Update Vehicle info
UPDATE "vehicles"
SET "year" = '1971'
WHERE "id" = '2';

-- Update Job info
UPDATE "jobs"
SET "name" = 'Respray and underseal'
WHERE "id" = '1';

-- Update Comment
UPDATE "comments"
SET "text" = 'That is fine, go ahead'
WHERE "id" = '2';

-- Update Quotes
UPDATE "quotes"
SET "duration" = '1 week'
WHERE "id" = '1';
