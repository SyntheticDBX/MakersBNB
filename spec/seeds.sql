
TRUNCATE TABLE spaces RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE bookings RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS public.users
(
    id                SERIAL PRIMARY KEY,
    first_name        VARCHAR(30),
    last_name         VARCHAR(30),
    email_address     VARCHAR(50),
    password          VARCHAR(30),
    username          VARCHAR(30),
    user_created_date DATE

);



CREATE TABLE IF NOT EXISTS public.spaces
(
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(100),
    description         VARCHAR(300),
    user_id             INT,
    CONSTRAINT fk_user FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    first_line_address  VARCHAR(30),
    second_line_address VARCHAR(30),
    city                VARCHAR(20),
    country             VARCHAR(30),
    postcode            VARCHAR(10),
    space_created_date  DATE,
    price_per_night     DECIMAL(6, 2)

);

CREATE TABLE IF NOT EXISTS public.bookings
(
    id                   SERIAL PRIMARY KEY,
    user_id              INT,
    CONSTRAINT fk_user FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    space_id             INT,
    CONSTRAINT fk_space FOREIGN KEY (space_id)
        REFERENCES spaces (id)
        ON DELETE CASCADE,
    booking_start_date   DATE,
    booking_end_date     DATE,
    booking_approved     BOOLEAN,
    booking_created_date DATE
);

INSERT INTO users (id, first_name, last_name, username, email_address, password, user_created_date)
VALUES (1, 'Poul', 'Wadwell', 'pwadwell0', 'pwadwell0@state.gov', '3WijXUerH', '2022-07-08T07:18:11Z');
INSERT INTO users (id, first_name, last_name, username, email_address, password, user_created_date)
VALUES (2, 'Louisette', 'O''Teague', 'loteague1', 'loteague1@imgur.com', 'fQ3gQAOEZ4', '2022-12-31T18:13:20Z');
INSERT INTO users (id, first_name, last_name, username, email_address, password, user_created_date)
VALUES (3, 'Charissa', 'Melin', 'cmelin2', 'cmelin2@irs.gov', 'LY8jyv', '2022-11-03T23:42:43Z');
INSERT INTO users (id, first_name, last_name, username, email_address, password, user_created_date)
VALUES (4, 'Britt', 'Burras', 'bburras3', 'bburras3@house.gov', '5Gg6Hml', '2022-04-17T03:24:17Z');
INSERT INTO users (id, first_name, last_name, username, email_address, password, user_created_date)
VALUES (5, 'Gunar', 'Galilee', 'ggalilee4', 'ggalilee4@chronoengine.com', 'xvx8vwOUw', '2022-09-18T15:41:04Z');

INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night)
VALUES (1, 'Allantoparmelia alpicola (Th. Fr.) Essl.',
        'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus  nascetur ridiculuss mus etiam',
        4, 'Main', 'Suite 17', 'Baiquesi', 'China', 'SL6 1XA', '2019-08-17T04:23:41Z', 663.33);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode,
                    space_created_date, price_per_night)
VALUES (2, 'Nemacladus interior (Munz) G.T. Robbins',
        'quis lectus suspendisse potenti in eleia quis augue lunibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt',
        2, 'Lukken', 'Room 493', 'Jilong', 'China', 'sw7 232', '2019-08-15T07:32:53Z', 780.83);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode,
                    space_created_date, price_per_night)
VALUES (3, 'Lecidea lepidastra (Tuck.) Hasse',
        'eu mi nulla ac enim in tempor tu mattis  donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci',
        4, 'Riverside', 'PO Box 13828', 'Lusacan', 'Philippines', '4325', '2020-01-21T15:21:57Z', 725.82);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode,
                    space_created_date, price_per_night)
VALUES (4, 'Carex shinnersii P. Rothr. & Reznicek',
        'montes nascetur ridiculus mus etiam vel augue vestibd massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vu',
        1, 'Cordelia', 'Room 1484', 'Itigi', 'Tanzania', 'tw8 3dt', '2020-01-06T07:37:12Z', 474.42);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode,
                    space_created_date, price_per_night)
VALUES (5, 'Huperzia ×erubescens (Brack.) Holub (pro sp.)',
        'nec condimentum neque sapien placerat ante nulla justtortor duis mattis egestas metus',
        5, 'Porter', 'Room 1674', 'Capim Grosso', 'Brazil', '44695000', '2019-11-10T16:49:15Z', 419.74);
        
INSERT INTO bookings (id, user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (1, 3, 1, '2023-01-14T06:30:11Z', '2023-10-17T06:11:58Z', FALSE, '2021-03-21T18:58:12Z');
INSERT INTO bookings (id, user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (2, 2, 2, '2023-05-18T04:07:48Z', '2023-09-30T01:59:43Z', TRUE, '2021-03-20T09:54:43Z');
INSERT INTO bookings (id, user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (3, 1, 4, '2023-01-29T12:08:21Z', '2023-10-22T02:22:25Z', TRUE, '2021-01-15T17:27:16Z');
INSERT INTO bookings (id, user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (4, 4, 3, '2023-01-15T14:09:10Z', '2023-12-19T02:19:59Z', FALSE, '2021-03-23T06:36:38Z');
INSERT INTO bookings (id, user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (5, 5, 5, '2023-03-08T13:15:31Z', '2023-09-16T22:02:41Z', FALSE, '2021-03-13T23:46:45Z');


