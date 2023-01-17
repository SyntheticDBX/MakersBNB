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
    name                VARCHAR(30),
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
insert into users (id, first_name, last_name, username, space_id, password, user_created_date) values (1, 'Claudina', 'Autin', 'cautin0', 2, 'vCcbaj', '2022-02-18T12:43:50Z');
insert into users (id, first_name, last_name, username, space_id, password, user_created_date) values (2, 'Noelle', 'Conibeer', 'nconibeer1', 1, 'NYEWrYfkn3AA', '2022-07-15T09:24:14Z');
insert into users (id, first_name, last_name, username, space_id, password, user_created_date) values (3, 'Abdel', 'Andresen', 'aandresen2', 3, 'rEq1Zb', '2022-10-10T12:54:27Z');
insert into users (id, first_name, last_name, username, space_id, password, user_created_date) values (4, 'Lindsay', 'Housbey', 'lhousbey3', 5, 'QrIZrUIz96w', '2022-01-21T01:07:31Z');
insert into users (id, first_name, last_name, username, space_id, password, user_created_date) values (5, 'Alane', 'Fraser', 'afraser4', 4, 'SgG7jv', '2022-04-10T10:33:06Z');

insert into bookings (id, booking_start_date, booking_end_date, user_id, space_id, booking_approved?, booking_created_date) values (1, '2023-01-09T02:45:57Z', '2022-06-30T04:45:54Z', 4, 3, true, '2022-12-02T09:50:03Z');
insert into bookings (id, booking_start_date, booking_end_date, user_id, space_id, booking_approved?, booking_created_date) values (2, '2022-12-31T22:19:41Z', '2022-12-24T15:02:55Z', 4, 5, true, '2022-09-12T11:20:20Z');
insert into bookings (id, booking_start_date, booking_end_date, user_id, space_id, booking_approved?, booking_created_date) values (3, '2022-04-22T13:41:26Z', '2022-08-09T05:35:34Z', 2, 4, true, '2022-03-03T05:06:21Z');
insert into bookings (id, booking_start_date, booking_end_date, user_id, space_id, booking_approved?, booking_created_date) values (4, '2022-11-01T03:07:05Z', '2022-09-03T14:52:17Z', 4, 5, true, '2022-02-07T20:41:59Z');
insert into bookings (id, booking_start_date, booking_end_date, user_id, space_id, booking_approved?, booking_created_date) values (5, '2022-02-17T16:04:24Z', '2022-06-16T06:48:58Z', 4, 1, true, '2022-08-03T00:35:13Z');

insert into spaces (id, user_id, first_line_address, second_line_address, city, country, postcode, description, space_created_date, price) values (1, 3, '69 Lakewood Road', 'Apt 460', 'Udon Thani', 'Thailand', '10310', 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat', '2022-05-26T03:56:00Z', 'Baht');
insert into spaces (id, user_id, first_line_address, second_line_address, city, country, postcode, description, space_created_date, price) values (2, 4, '6 Monterey Plaza', 'PO Box 19601', 'Zruč nad Sázavou', 'Czech Republic', '285 22', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida', '2022-05-15T23:17:27Z', 'Koruna');
insert into spaces (id, user_id, first_line_address, second_line_address, city, country, postcode, description, space_created_date, price) values (3, 1, '6 Bonner Crossing', 'Apt 124', 'Sindangan', 'Philippines', '6305', 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', '2022-05-14T06:13:24Z', 'Peso');
insert into spaces (id, user_id, first_line_address, second_line_address, city, country, postcode, description, space_created_date, price) values (4, 1, '7 Lien Crossing', '3rd Floor', 'Na Tan', 'Thailand', '37180', 'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', '2022-05-07T04:26:59Z', 'Baht');
insert into spaces (id, user_id, first_line_address, second_line_address, city, country, postcode, description, space_created_date, price) values (5, 3, '38718 Sachs Way', 'Apt 862', 'Tessaoua', 'Niger', null, 'ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', '2022-09-20T01:49:37Z', 'Franc');

