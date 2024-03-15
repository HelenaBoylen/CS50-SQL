CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "airline" TEXT NOT NULL,
    "flt_number" TEXT NOT NULL,
    "ap_code_dep_from" TEXT NOT NULL,
    "ap_code_arr_to" TEXT NOT NULL CHECK("ap_code_arr_to" != "ATL"),
    "exp_dep_datetime" NUMERIC NOT NULL,
    "exp_arr_datetime" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flt_number" TEXT NOT NULL,
    "check_in_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passgengers"("id"),
    FOREIGN KEY("flt_number") REFERENCES "flights"("flt_number")
);
