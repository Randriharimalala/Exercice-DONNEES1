CREATE VIEW user_name AS SELECT first_name FROM "user";
    SELECT * FROM user_name;

CREATE VIEW show_user AS SELECT first_name, last_name , age, email , count(id_post) FROM post p INNER JOIN "user" u ON p.id_post = u.id_user;
    SELECT * FROM show_user ;

