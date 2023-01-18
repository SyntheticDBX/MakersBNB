TRUNCATE TABLE users RESTART IDENTITY CASCADE;

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE IF NOT EXISTS users (

    id serial PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(30),
    email_address varchar(50),
    password varchar(30),
    username varchar(30),
    user_created_date date

);

INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Claudina', 'Autin', 'cautin0', 'claudina@email.com', 'vCcbaj', '2022-02-18T12:43:50Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Noelle', 'Conibeer', 'nconibeer1', 'noelle@email.com', 'NYEWrYfkn3AA', '2022-07-15T09:24:14Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Abdel', 'Andresen', 'aandresen2', 'abdel@email.com', 'rEq1Zb', '2022-10-10T12:54:27Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Lindsay', 'Housbey', 'lhousbey3','lindsay@email.com', 'QrIZrUIz96w', '2022-01-21T01:07:31Z');
INSERT INTO users ("first_name", "last_name", "username", "email_address", "password", "user_created_date") values ('Alane', 'Fraser', 'afraser4', 'alane@email.com', 'SgG7jv', '2022-04-10T10:33:06Z');