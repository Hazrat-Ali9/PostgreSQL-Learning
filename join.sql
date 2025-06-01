CREATE Table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE Table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
)



INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);


DROP Table post;
DROP Table "user";

SELECT * from "user";
SELECT * from post;

SELECT * FROM post as p
JOIN "user" u on p.user_id = u.id;



INSERT INTO post (id, title, user_id) VALUES
(5,'this is a test post title', NULL);


SELECT * FROM post as p
LEFt OUTER JOIN "user" u on p.user_id = u.id;


SELECT * FROM post as p
RIGHT OUTER JOIN "user" u on p.user_id = u.id;



SELECT * FROM post as p
FULL OUTER JOIN "user" u on p.user_id = u.id;
