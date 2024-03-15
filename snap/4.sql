-- Find the username of the user who has had the most messages sent to them

SELECT "users"."username" FROM "messages"
JOIN "users" ON "messages"."to_user_id" = "users"."id"
GROUP BY "messages"."to_user_id"
ORDER BY COUNT("messages"."to_user_id") DESC, "users"."username"LIMIT 1;
