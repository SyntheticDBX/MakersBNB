CREATE TABLE IF NOT EXISTS public.users
(
    id                SERIAL
        PRIMARY KEY,
    first_name        VARCHAR(30),
    surname           VARCHAR(30),
    email_address     VARCHAR(50),
    password          VARCHAR(30),
    username          VARCHAR(30),
    user_created_date DATE
);

CREATE TABLE IF NOT EXISTS public.spaces
(
    id                  SERIAL
        PRIMARY KEY,
    user_id             INTEGER
        CONSTRAINT spaces_users_id_fk
            REFERENCES public.users,
    first_address_line  VARCHAR(30),
    second_address_line VARCHAR(30),
    city                VARCHAR(20),
    country             VARCHAR(30),
    postcode            VARCHAR(10),
    description         VARCHAR(300),
    price               money,
    space_created_date  DATE
);

CREATE TABLE IF NOT EXISTS public.bookings
(
    id                   SERIAL
        CONSTRAINT bookings_pk
            PRIMARY KEY,
    booking_start_date   DATE,
    booking_end_date     DATE,
    user_id              INTEGER
        CONSTRAINT bookings_users_id_fk
            REFERENCES public.users,
    space_id             INTEGER
        CONSTRAINT bookings_spaces_id_fk
            REFERENCES public.spaces,
    "booking_approved?"  BOOLEAN,
    booking_created_date DATE
);


