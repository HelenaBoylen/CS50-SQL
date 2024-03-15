-- determine how many points of latitude we have at least one data point for

SELECT COUNT(DISTINCT("latitude")) FROM "normals" WHERE "0m" IS NOT NULL;
