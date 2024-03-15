-- find the 10 locations with the highest normal ocean surface temperature, sorted warmest to coldest.

SELECT "latitude", "longitude", "0m" AS "Surface Temperature" FROM "normals"
ORDER BY "0m" DESC, "latitude" LIMIT 10;
