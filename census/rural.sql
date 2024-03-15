-- create a view that displays entries with rural in locality field

CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" LIKE '%Rural%';
