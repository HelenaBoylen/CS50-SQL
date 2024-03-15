-- create the temp table meteorites
CREATE TABLE "meteorites_temp" (
    "name" TEXT NOT NULL,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")

);

-- import the .csv file
.import --csv --skip 1 meteorites.csv meteorites_temp

-- clean up the Mass field
UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "id" IN (
    SELECT "id" FROM "meteorites_temp"
    WHERE "mass" = ''
);

-- clean up the Year field
UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "id" IN (
    SELECT "id" FROM "meteorites_temp"
    WHERE "year" = ''
);

-- clean up the Lat field
UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "id" IN (
    SELECT "id" FROM "meteorites_temp"
    WHERE "lat" = ''
);

-- clean up the Long field
UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "id" IN (
    SELECT "id" FROM "meteorites_temp"
    WHERE "long" = ''
);

-- Round up the Mass/Lat/Long fields to 2 dec places
UPDATE "meteorites_temp"
SET
"mass" = ROUND("mass", 2),
"lat" = ROUND("lat", 2),
"long" = ROUND("long", 2);

-- Create new Meteorites table for cleaned data
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

-- Insert the data from temp table to real table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year", "name";
