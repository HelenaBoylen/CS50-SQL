SELECT "city", COUNT("city") AS "Number of Schools" FROM "schools"
	WHERE "type" = 'Public School'
 	GROUP BY "city"
 	ORDER BY "Number of Schools" DESC, "city" LIMIT 10;
