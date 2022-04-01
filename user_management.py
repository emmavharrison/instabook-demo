from utils import get_db_connection


def add_user(username, display_name, pin):
    """
    Add a new user to the database
    Required tables: users
    """

    with get_db_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("""INSERT INTO users
                            (username, display_name, pin)
                            VALUES
                            (%s, %s, %s);""", (username, display_name, pin))
            connection.commit()
            # this is transaction stuff - commit/rollback

# we use a with block because, like with files, we want to close them after we are done
# at the end of the with block, the connection will close
# a with block is a context manager, once you exit the with block it closes it for you

def username_available(username):
    """
    Return True if a username is taken, or False otherwise
    Required tables: users u
    """
    with get_db_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(f"""SELECT *
                                FROM users u
                                WHERE u.username = %s;""", (username,))
            # this SELECT query basically with select all of the usernames where the username
            # is the same as the username given by the user
            results = cursor.fetchall()
            # fetchall basically means "OK, we have ran our SELECT query, and now we want to fetch
            # all of the results
            if len(results) > 0:
                return False
            # i.e. if the results are more than 0, that means the username is taken
            # because there is already a row in our SQL table with that name
            # so it says "is the username available: false. username is taken"
            else:
                return True
            # if the results are 0, that means that the username is not taken
            # because there are no results with that name


print(username_available("emma"))



def get_user_with_credentials(username, pin):
    """
    Return a user id (if it exists) given a username and pin
    Required columns: u.id
    Required tables: users u
    """
    with get_db_connection() as connection:
        with connection.cursor() as cursor:
            # Example - this one is filled in for you
            cursor.execute("""SELECT u.id
                              FROM users u
                              WHERE u.username = %s
                              AND u.pin = %s""", (username, pin))
            user_ids = cursor.fetchall()
            if len(user_ids) > 0:
                return user_ids[0][0]  # Return the id from the first (and hopefully only) row


def search_users(name):
    """
    Get all users whose username or display name is like a particular name
    Required columns: u.id, u.username, u.display_name
    Required tables: users u
    """
    with get_db_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("""SELECT u.id, u.username, u.display_name
                              FROM users u
                              WHERE u.username LIKE CONCAT('%', %s, '%')
                              OR u.display_name LIKE CONCAT('%', %s, '%');""", (name, name))
            results = cursor.fetchall()
            return results


def get_user_details(user_id):
    """
    Return details of a specific user
    Required columns: u.id, u.username, u.display_name
    Required tables: users u
    """
    with get_db_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("""SELECT u.id, u.username, u.display_name
                              FROM users u
                              WHERE u.id = %s;""", (user_id,))
            results = cursor.fetchall()
            if len(results) > 0:
                return results[0]
