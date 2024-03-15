SELECT "name", "exemplary", "per_pupil_expenditure" FROM "districts"
    JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
    JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
    WHERE  "per_pupil_expenditure" > (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
        )
       AND "exemplary" > (
       SELECT AVG("exemplary") FROM "staff_evaluations"
       )
    AND "name" IN (
        SELECT "name" FROM "districts"
        WHERE "id" IN (
            SELECT DISTINCT("district_id") FROM "schools"
            WHERE "type" = 'Public School'
            )
        )

ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
