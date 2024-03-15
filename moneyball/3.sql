-- Find Ken Griffey's home run history by year

SELECT "year", "HR" FROM "performances" WHERE "player_id" = (
	SELECT "id"
    FROM "players"
    WHERE "last_name" = 'Griffey'
    AND "birth_year" = '1969'
    )
ORDER BY "year" DESC;
