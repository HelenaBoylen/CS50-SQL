-- write a SQL query to find the 10 least expensive players per hit in 2001

SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit" FROM  "players"
    JOIN  "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN  "performances" ON "performances"."player_id" = "players"."id" AND "performances"."year" = "salaries"."year"
    WHERE "performances"."year" = '2001'AND "performances"."H" > 0
ORDER BY "dollars per hit", "players"."first_name", "players"."last_name" LIMIT 10;
