-- Find Cal Ripken's salary history by year

SELECT "year", "salary" FROM "salaries"
    WHERE "player_id" = (
        SELECT "id" FROM "players"
        WHERE "last_name" = 'Ripken'
        )
        ORDER BY "year" DESC;
