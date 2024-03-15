CREATE TABLE "ciphers" (
    "id" INTEGER,
    "sent_num" INTEGER NOT NULL,
    "char_num" INTEGER NOT NULL,
    "mess_len" INTEGER NOT NULL,
    PRIMARY KEY("id")
)

INSERT INTO "ciphers" ("sent_num","char_num","mess_len")
Values
('14','98','4'),
('114','3','5'),
('618','72','9'),
('630','7','3'),
('932','12','5'),
('2230','50','7'),
('2346','44','10'),
('3041','14','5');

