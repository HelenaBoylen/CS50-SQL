-- Find 50 lowest paid players in 2001

SELECT "first_name", "last_name", "salary" FROM "players"
   JOIN "salaries"
   ON "salaries"."player_id" = "players"."id"
   WHERE "year" = '2001'
   ORDER BY "salary", "first_name", "last_name" LIMIT 50;
