-- return all normal ocean temps at 50m and their degrees of lat and long, in the Arabian Sea.

SELECT "latitude", "longitude", "50m" AS "Normal Temperature at 50m" FROM "normals"
WHERE "latitude" BETWEEN 0 AND 20
AND "longitude" BETWEEN 55 AND 75;
