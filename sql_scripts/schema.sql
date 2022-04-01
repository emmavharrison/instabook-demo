CREATE DATABASE IF NOT EXISTS instabook;
USE instabook;

CREATE TABLE IF NOT EXISTS users (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL UNIQUE,
    display_name VARCHAR(50) NOT NULL,
    pin CHAR(4) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS followers (
	followed_user_id INTEGER NOT NULL,
    following_user_id INTEGER NOT NULL,

    PRIMARY KEY (followed_user_id, following_user_id),
    FOREIGN KEY (followed_user_id) REFERENCES users(id),
    FOREIGN KEY (following_user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS books (
	id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(55) NOT NULL,
    author VARCHAR(55) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS book_ratings (
	user_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    score INTEGER NOT NULL,
    review VARCHAR(255) NOT NULL,

    PRIMARY KEY (user_id, book_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    CHECK (score BETWEEN 1 AND 5)
);
