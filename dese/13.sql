-- Returns list of schools and their city where less than 50% graduated
SELECT "name", "city" FROM "schools"
WHERE "id" IN (
    SELECT "school_id"
    FROM "graduation_rates"
    WHERE "graduated" < 50
    ORDER BY "graduated" DESC
    );
