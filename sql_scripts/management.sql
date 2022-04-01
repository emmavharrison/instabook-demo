-- **
-- Part 1: INSERT queries
-- **

-- QUERY 1
-- Add a new user to the database, given a username, display_name and pin
-- Required tables: user u

-- QUERY 2
-- Add a new follower for a specific user, given a followed_user_id and a following_user_id
-- Required tables: followers f

-- QUERY 3
-- Add a user rating for a specific book into the database, given the user id, the book id, a score and a review
-- Required tables: book_ratings r


-- **
-- Part 2: SELECT queries
-- **

-- QUERY 1
-- Check if a particular username-pin combination exist, and get the user id if so
-- Required columns: u.id
-- Required tables: user u

-- QUERY 2
-- Return details of a specific user, given their user id
-- Required columns: u.id, u.username, u.display_name
-- Required tables: user u

-- QUERY 3
-- Get all users whose username or display name is like a particular name
-- Required columns: u.id, u.username, u.display_name
-- Required tables: user u
-- Required skills: LIKE

-- QUERY 4
-- Return TRUE if a username is taken, or FALSE otherwise
-- Required tables: user u
-- Required skills: CASE WHEN

-- QUERY 5
-- Return details of a specific book, given its book id
-- Required columns: b.title, b.author, AVG(r.score)
-- Required tables: books b, book_ratings r
-- Required skills: GROUP BY, JOIN

-- QUERY 6
-- Return a list of books whose titles are like a particular given title
-- Required columns: b.title, b.author, AVG(r.score)
-- Required tables: books b, book_ratings r
-- Required skills: GROUP BY, JOIN

-- QUERY 7
-- Get 10 most recent ratings from a particular user, given their user id
-- Required columns: r.score, r.review
-- Required tables: book_ratings r
-- Required skills: ORDER BY, LIMIT

-- QUERY 8
-- Get 10 most recent ratings from followed users, given the id of the following user
-- Required columns: u.id, u.username, u.display_name, r.score, r.review
-- Required tables: users u, followers f, book_ratings r
-- Required skills: JOIN, ORDER BY, LIMIT

-- **
-- Part 3: DELETE queries
-- **

-- QUERY 1
-- Delete a follower for a specific user, given a followed_user_id and a following_user_id
-- Required tables: followers f

-- QUERY 2
-- Remove a user rating for a specific book, given the user id and the book id
-- Required tables: book_ratings r
