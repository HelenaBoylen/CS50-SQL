-- find the normal ocean surface temperature in the Gulf of Maine

SELECT "0m" FROM "normals"
WHERE "latitude" = 42.5
AND "longitude" = -69.5;
