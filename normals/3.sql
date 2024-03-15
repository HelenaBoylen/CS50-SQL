-- find the normal temperature at 0 meters, 100 meters, and 200 meters near Osaka Bay, Japan

SELECT "0m", "100", "200" FROM "normals"
WHERE "latitude" = 33.5
AND "longitude" = -137.5;
