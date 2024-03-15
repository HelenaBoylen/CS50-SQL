-- Find 5 lowest paying teams

SELECT "name", ROUND(AVG("salary"), 2) AS "average salary" FROM "teams"
    JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
    WHERE "salaries"."year" = '2001'
    GROUP BY "team_id", "name"
    ORDER BY "average salary"
    LIMIT 5;
