-- Create a table of players names. salaries, home runs and year relating to the HRs

SELECT "first_name", "last_name", "salary", "salaries"."year", "HR" FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    AND "performances"."year" = "salaries"."year"
ORDER BY
    "players"."id", "performances"."year" DESC, "salaries"."year" DESC,"HR" DESC, "salary" DESC;

-- Todd Zeile appears to have 2 entries in 1995 as he seems to have switched teams mid-season to Chicago Cubs
