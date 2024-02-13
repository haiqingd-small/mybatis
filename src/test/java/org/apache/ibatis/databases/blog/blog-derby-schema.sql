use sysibm;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post_tag;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS blog;
DROP TABLE IF EXISTS author;
DROP PROCEDURE IF EXISTS selectTwoSetsOfAuthors;
DROP PROCEDURE IF EXISTS insertAuthor;
DROP PROCEDURE IF EXISTS selectAuthorViaOutParams;

CREATE TABLE author (
                        id INT NOT NULL AUTO_INCREMENT,
                        username VARCHAR(255) NOT NULL,
                        password VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL,
                        bio LONGTEXT,
                        favourite_section VARCHAR(25),
                        PRIMARY KEY (id)
);

CREATE TABLE blog (
                      id INT NOT NULL AUTO_INCREMENT,
                      author_id INT NOT NULL,
                      title VARCHAR(255),
                      PRIMARY KEY (id),
                      FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE post (
                      id INT NOT NULL AUTO_INCREMENT,
                      blog_id INT,
                      author_id INT NOT NULL,
                      created_on TIMESTAMP NOT NULL,
                      section VARCHAR(25) NOT NULL,
                      subject VARCHAR(255) NOT NULL,
                      body LONGTEXT NOT NULL,
                      draft INT NOT NULL,
                      PRIMARY KEY (id),
                      FOREIGN KEY (blog_id) REFERENCES blog(id),
                      FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE tag (
                     id INT NOT NULL AUTO_INCREMENT,
                     name VARCHAR(255) NOT NULL,
                     PRIMARY KEY (id)
);

CREATE TABLE post_tag (
                          post_id INT NOT NULL,
                          tag_id INT NOT NULL,
                          PRIMARY KEY (post_id, tag_id),
                          FOREIGN KEY (post_id) REFERENCES post(id),
                          FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE comment (
                         id INT NOT NULL AUTO_INCREMENT,
                         post_id INT NOT NULL,
                         name LONGTEXT NOT NULL,
                         comment LONGTEXT NOT NULL,
                         PRIMARY KEY (id),
                         FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE node (
                      id INT NOT NULL,
                      parent_id INT,
                      PRIMARY KEY(id)
);

DELIMITER //

CREATE PROCEDURE selectTwoSetsOfAuthors(IN DP1 INT, IN DP2 INT)
BEGIN
    -- Your stored procedure logic here
END//

CREATE PROCEDURE insertAuthor(IN DP1 INT, IN DP2 VARCHAR(255), IN DP3 VARCHAR(255), IN DP4 VARCHAR(255))
BEGIN
    -- Your stored procedure logic here
END//

CREATE PROCEDURE selectAuthorViaOutParams(IN ID INT, OUT USERNAME VARCHAR(255), OUT PASSWORD VARCHAR(255), OUT EMAIL VARCHAR(255), OUT BIO VARCHAR(255))
BEGIN
    -- Your stored procedure logic here
END//

DELIMITER ;
