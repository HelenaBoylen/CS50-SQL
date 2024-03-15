-- find the user IDs of mutual friends of lovelytrust487 and exceptionalinspiration482

SELECT "friend_id" FROM "friends" WHERE "user_id" = (
    SELECT "id" FROM "users" WHERE "username" = 'lovelytrust487'
    )
INTERSECT
SELECT "friend_id" FROM "friends" WHERE "user_id" = (
    SELECT "id" FROM "users" WHERE "username" = 'exceptionalinspiration482'
    );
