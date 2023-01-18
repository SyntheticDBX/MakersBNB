CREATE TABLE IF NOT EXISTS public.users (

    id serial PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(30),
    email_address varchar(50),
    password varchar(30),
    username varchar(30),
    user_created_date date

);

CREATE TABLE IF NOT EXISTS public.spaces (
    id serial PRIMARY KEY,
    name                varchar(30),
    first_line_address  varchar(30),
    second_line_address varchar(30),
    city                varchar(20),
    country             varchar(30),
    postcode            varchar(10),
    description         varchar(300),
    price_per_night               int,
    space_created_date  date,
    user_id int,
        constraint fk_user foreign key(user_id)
           references users(id)
           on delete cascade

);

CREATE TABLE IF NOT EXISTS public.bookings (
    id serial PRIMARY KEY,
    booking_start_date   date,
    booking_end_date     date,
    booking_approved  boolean,
    booking_created_date date,
    user_id int,
        constraint fk_user foreign key(user_id)
           references users(id)
           on delete cascade,
    space_id           int,
        constraint fk_space foreign key(space_id)
            references spaces(id)
            on delete cascade

);

INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Claudina', 'Autin', 'cautin0', 'claudina@email.com', 'vCcbaj', '2022-02-18T12:43:50Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Noelle', 'Conibeer', 'nconibeer1', 'noelle@email.com', 'NYEWrYfkn3AA', '2022-07-15T09:24:14Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Abdel', 'Andresen', 'aandresen2', 'abdel@email.com', 'rEq1Zb', '2022-10-10T12:54:27Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Lindsay', 'Housbey', 'lhousbey3','lindsay@email.com', 'QrIZrUIz96w', '2022-01-21T01:07:31Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Alane', 'Fraser', 'afraser4', 'alane@email.com', 'SgG7jv', '2022-04-10T10:33:06Z');

INSERT INTO spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country", "postcode", "description", "space_created_date", "price_per_night") values (1, 'Cottage house', '69 Lakewood Road', 'Apt 460', 'Udon Thani', 'Thailand', '10310', 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo ', '2022-05-26T03:56:00Z', 80);
INSERT INTO spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country", "postcode", "description", "space_created_date", "price_per_night") values (2, 'Treehouse', '6 Monterey Plaza', 'PO Box 19601', 'Zruč nad Sázavou', 'Czech Republic', '285 22', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', '2022-05-15T23:17:27Z', 85);
INSERT INTO spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country", "postcode", "description", "space_created_date", "price_per_night") values (3, '2-bedroom flat', '6 Bonner Crossing', 'Apt 124', 'Sindangan', 'Philippines', '6305', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', '2022-05-14T06:13:24Z', 90);
INSERT INTO spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country", "postcode", "description", "space_created_date", "price_per_night") values (4, '1-bedroom bungalow', '7 Lien Crossing', '3rd Floor', 'Na Tan', 'Thailand', '37180', 'non velit donec diam neque vestibulum eget posuere cubilia curae donec pharetra magna non mi integer', '2022-05-07T04:26:59Z', 55);
INSERT INTO spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country", "postcode", "description", "space_created_date", "price_per_night") values (5, '1-bedroom flat', '38718 Sachs Way', 'Apt 862', 'Tessaoua', 'Niger', '74291', 'ut nulla sed accumsan felis ut at dolor quis odio consequat varius ac nulla sed vel enim sit amet', '2022-09-20T01:49:37Z', 60);

INSERT INTO bookings ("user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (4, 3, '2023-01-09T02:45:57Z', '2022-06-30T04:45:54Z', true, '2022-12-02T09:50:03Z');
INSERT INTO bookings ("user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (4, 5, '2022-12-31T22:19:41Z', '2022-12-24T15:02:55Z', true, '2022-09-12T11:20:20Z');
INSERT INTO bookings ("user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (2, 4, '2022-04-22T13:41:26Z', '2022-08-09T05:35:34Z', true, '2022-03-03T05:06:21Z');
INSERT INTO bookings ("user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (4, 5, '2022-11-01T03:07:05Z', '2022-09-03T14:52:17Z', true, '2022-02-07T20:41:59Z');
INSERT INTO bookings ("user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (4, 1, '2022-02-17T16:04:24Z', '2022-06-16T06:48:58Z', true, '2022-08-03T00:35:13Z');
