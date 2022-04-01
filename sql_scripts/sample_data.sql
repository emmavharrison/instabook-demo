USE instabook;

INSERT INTO users (username, display_name, pin) VALUES
('emily', 'Emily F', '1234'),
('emma', 'Emma M', '5678'),
('kim', 'Kim G', '0000');

INSERT INTO followers (followed_user_id, following_user_id) VALUES
(1, 3),
(2, 3),
(1, 2);

INSERT INTO books (title, author) VALUES
('Ron Weasley and the Pile of Rocks', 'J. K. Rowling'),
('The Desecration of the Rings', 'J. R. R. Tolkein'),
('The Tiger, the Wizard and the Dishwasher', 'C. S. Lewis'),
('Peter Ferret', 'Beatrix Potter');

INSERT INTO book_ratings (user_id, book_id, score, review) VALUES
(1, 4, 5, 'Riveting'),
(2, 2, 3, 'A bit long'),
(3, 1, 2, 'Not really a fan of rocks'),
(3, 3, 4, 'A truly radical work'),
(3, 4, 5, 'Very strong writing');
