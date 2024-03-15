-- Find the user IDs of the top 3 users to whom creativewisdom377 sends messages most frequently

SELECT "to_user_id" FROM "messages"
LEFT JOIN "users" ON "messages"."from_user_id" = "users"."id"
WHERE "users"."username" = 'creativewisdom377'
GROUP BY "to_user_id" ORDER BY COUNT("to_user_id") DESC LIMIT 3;

