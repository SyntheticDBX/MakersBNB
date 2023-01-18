TRUNCATE TABLE public.spaces RESTART IDENTITY CASCADE;

DROP TABLE IF EXISTS public.spaces CASCADE;

CREATE TABLE IF NOT EXISTS public.spaces
(
    id                  serial PRIMARY KEY,
    name                varchar(30),
    first_line_address  varchar(30),
    second_line_address varchar(30),
    city                varchar(20),
    country             varchar(30),
    postcode            varchar(10),
    description         varchar(300),
    price_per_night     int,
    space_created_date  date,
    user_id             int,
    constraint fk_user foreign key (user_id)
        references users (id)
        on delete cascade

);

INSERT INTO public.spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country",
                           "postcode",
                           "description", "space_created_date", "price_per_night")
values (1, 'Cottage house', '69 Lakewood Road', 'Apt 460', 'Udon Thani', 'Thailand', '10310',
        'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo ',
        '2022-05-26T03:56:00Z', 80);
INSERT INTO public.spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country",
                           "postcode",
                           "description", "space_created_date", "price_per_night")
values (2, 'Treehouse', '6 Monterey Plaza', 'PO Box 19601', 'Zruč nad Sázavou', 'Czech Republic', '285 22',
        'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque',
        '2022-05-15T23:17:27Z', 85);
INSERT INTO public.spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country",
                           "postcode",
                           "description", "space_created_date", "price_per_night")
values (3, '2-bedroom flat', '6 Bonner Crossing', 'Apt 124', 'Sindangan', 'Philippines', '6305',
        'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate',
        '2022-05-14T06:13:24Z', 90);
INSERT INTO public.spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country",
                           "postcode",
                           "description", "space_created_date", "price_per_night")
values (4, '1-bedroom bungalow', '7 Lien Crossing', '3rd Floor', 'Na Tan', 'Thailand', '37180',
        'non velit donec diam neque vestibulum eget posuere cubilia curae donec pharetra magna non mi integer',
        '2022-05-07T04:26:59Z', 55);
INSERT INTO public.spaces ("user_id", "name", "first_line_address", "second_line_address", "city", "country",
                           "postcode",
                           "description", "space_created_date", "price_per_night")
values (5, '1-bedroom flat', '38718 Sachs Way', 'Apt 862', 'Tessaoua', 'Niger', '74291',
        'ut nulla sed accumsan felis ut at dolor quis odio consequat varius ac nulla sed vel enim sit amet',
        '2022-09-20T01:49:37Z', 60);