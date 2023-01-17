TRUNCATE TABLE users, spaces, bookings RESTART IDENTITY;

CREATE TABLE IF NOT EXISTS users
(
    id            SERIAL
        PRIMARY KEY,
    first_name    VARCHAR(30),
    surname       VARCHAR(30),
    email_address VARCHAR(50),
    password      VARCHAR(30),
    username      VARCHAR(30),
    user_created  DATE
);

CREATE TABLE IF NOT EXISTS spaces
(
    id                  SERIAL
        PRIMARY KEY,
    user_id             INTEGER
        CONSTRAINT spaces_users_id_fk
            REFERENCES users,
    "1st_address_line " VARCHAR(30),
    "2nd_address_line"  VARCHAR(30),
    city                VARCHAR(20),
    country             VARCHAR(30),
    postcode            VARCHAR(10),
    description         VARCHAR(300),
    price               money,
    listing_created     DATE
);

CREATE TABLE IF NOT EXISTS bookings
(
    id                  SERIAL
        CONSTRAINT bookings_pk
            PRIMARY KEY,
    booking_start_date  DATE,
    booking_end_date    DATE,
    user_id             INTEGER
        CONSTRAINT bookings_users_id_fk
            REFERENCES users,
    space_id            INTEGER
        CONSTRAINT bookings_spaces_id_fk
            REFERENCES spaces,
    "booking_approved?" BOOLEAN
);
