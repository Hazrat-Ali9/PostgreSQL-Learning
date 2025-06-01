-- Active: 1699467625194@@127.0.0.1@5432@ph@public


SELECT * from person4;

ALTER TABLE person2
    ADD COLUMN email VARCHAR(25)  DEFAULT 'default@mail.com' NOT NULL;

ALTER TABLE person2
    DROP COLUMN email;

ALTER TABLE person2
    RENAME COLUMN age to user_age;

ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);

ALTER TABLE person2
    ALTER COLUMN user_age set UNIQUE;

ALTER TABLE person2
    ALTER COLUMN user_age drop NOT null;


ALTER TABLE person2
    ADD constraint unique_person2_user_age UNIQUE(user_age);


ALTER TABLE person2
    DROP constraint unique_person2_user_age;


TRUNCATE TABLE person2;
DROP TABLE person2;


-- INSERT into person4 VALUES(10,'mizan', 45);



