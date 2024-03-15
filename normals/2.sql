-- find the normal temperature of the deepest sensor near the Gulf of Maine

SELECT "225m" FROM "normals"
WHERE "latitude" = 42.5
AND "longitude" = -69.5;
