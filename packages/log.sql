
-- *** The Lost Letter ***
-- I'm retrieving the from and to addresses to get the package id
-- then selecting the time a package was Dropped from Scans table
-- with pacakge id and To Address id matching
-- Note that the To address as given by customer didn't match, so
-- I used Like and % to filter out possible typos
-- So I can confirm the package was dropped at 23:07

SELECT "timestamp" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
          SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
 			) AND "to_address_id" = (
                SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Finn%'
                )
) AND "action" = 'Drop';

-- *** The Devious Delivery ***
-- First I ran a query to check any packages similar using LIKE and %duck% with no From Address
SELECT "id", "from_address_id", "to_address_id" FROM "packages" WHERE "contents" LIKE '%duck%' AND "from_address_id" IS NULL;
-- Then I rand a more specific query to check for items with no From Address in Packages,
-- Contents containing Duck, nested within a query checking  package ID and address ID where
-- the action is Drop in Scans. Finally I checked the address in the address table.
-- The item was dropped at a police station.
SELECT "address", "type" FROM "addresses" WHERE "id" = (
   SELECT "address_id" FROM "scans" WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id" FROM "packages" WHERE "contents" LIKE '%duck%'
        AND "from_address_id" IS NULL
      )
  );

-- *** The Forgotten Gift ***
SELECT "package_id", "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = '9873' AND "to_address_id" = '4983'
    );

