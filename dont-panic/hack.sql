-- alter admin password to OOps! (MD5), Erase log of change, add log of emily33 changing password.

-- insert new row into user_log to show emily33 changed the admin password
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update','admin','admin','e10adc3949ba59abbe56e057f20f883e',(
    SELECT "password" FROM "users" WHERE "username" = 'emily33'
    )
);
-- update the password with Oops! hashed
UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- change the user_logs to show emily33's password as Oops
UPDATE "user_logs" SET "new_password" = (
    SELECT "password" FROM "users"
    WHERE "username" = 'emily33'
    );

-- delete the evidence!
DELETE FROM "user_logs" WHERE "id" = '52';
