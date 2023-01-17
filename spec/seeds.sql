CREATE TABLE users (

    id serial PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(30),
    email_address varchar(50),
    password varchar(30),
    username varchar(30),
    user_created_date date

);

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
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

CREATE TABLE bookings (
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

INSERT INTO users ("id", "first_name", "last_name", "username", "email_address", "password", "user_created_date") values (1, 'Claudina', 'Autin', 'cautin0', 'claudina@email.com', 'vCcbaj', '2022-02-18T12:43:50Z');
INSERT INTO users ("id", "first_name", "last_name", "username", "email_address", "password", "user_created_date") values (2, 'Noelle', 'Conibeer', 'nconibeer1', 'noelle@email.com', 'NYEWrYfkn3AA', '2022-07-15T09:24:14Z');
INSERT INTO users ("id", "first_name", "last_name", "username", "email_address", "password", "user_created_date") values (3, 'Abdel', 'Andresen', 'aandresen2', 'abdel@email.com', 'rEq1Zb', '2022-10-10T12:54:27Z');
INSERT INTO users ("id", "first_name", "last_name", "username", "email_address", "password", "user_created_date") values (4, 'Lindsay', 'Housbey', 'lhousbey3','lindsay@email.com', 'QrIZrUIz96w', '2022-01-21T01:07:31Z');
INSERT INTO users ("id", "first_name", "last_name", "username", "email_address", "password", "user_created_date") values (5, 'Alane', 'Fraser', 'afraser4', 'alane@email.com', 'SgG7jv', '2022-04-10T10:33:06Z');

INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) values (1, 'Phaeographis sericea (Eschw.) Müll. Arg.', 'dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea', 1, 'Straubel', 'Apt 1004', 'Giồng Riềng', 'Vietnam', null, '2022-01-29T06:37:38Z', 279.88);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) values (2, 'Polygonum amphibium L.', 'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', 5, 'Michigan', '18th Floor', 'Franco da Rocha', 'Brazil', '07800-000', '2022-06-06T08:32:10Z', 932.23);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) values (3, 'Comarostaphylis diversifolia (Parry) Greene ssp. planifolia (Jeps.) G. Wallace ex Thorne', 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan', 3, 'Lillian', 'Room 327', 'Timbaúba', 'Brazil', '55870-000', '2022-09-22T10:23:54Z', 311.46);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) values (4, 'Clerodendrum thompsoniae Balf. f.', 'dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 2, 'Jay', 'Room 1813', 'Weixin', 'China', null, '2022-10-07T05:59:00Z', 930.14);
INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) values (5, 'Eriogonum strictum Benth. ssp. proliferum (Torr. & A. Gray) S. Stokes var. proliferum (Torr. & A. Gray) C.L. Hitchc.', 'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere', 5, 'Dryden', 'Suite 65', 'Quelimane', 'Mozambique', null, '2022-04-04T22:13:40Z', 709.1);

INSERT INTO bookings ("id", "user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (1, 4, 3, '2023-01-09T02:45:57Z', '2022-06-30T04:45:54Z', true, '2022-12-02T09:50:03Z');
INSERT INTO bookings ("id", "user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (2, 4, 5, '2022-12-31T22:19:41Z', '2022-12-24T15:02:55Z', true, '2022-09-12T11:20:20Z');
INSERT INTO bookings ("id", "user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (3, 2, 4, '2022-04-22T13:41:26Z', '2022-08-09T05:35:34Z', true, '2022-03-03T05:06:21Z');
INSERT INTO bookings ("id", "user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (4, 4, 5, '2022-11-01T03:07:05Z', '2022-09-03T14:52:17Z', true, '2022-02-07T20:41:59Z');
INSERT INTO bookings ("id", "user_id", "space_id", "booking_start_date", "booking_end_date", "booking_approved", "booking_created_date") values (5, 4, 1, '2022-02-17T16:04:24Z', '2022-06-16T06:48:58Z', true, '2022-08-03T00:35:13Z');

