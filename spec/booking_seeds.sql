TRUNCATE TABLE bookings RESTART IDENTITY CASCADE;

INSERT INTO bookings (user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (3, 1, '2023-01-14T06:30:11Z', '2023-10-17T06:11:58Z', FALSE, '2021-03-21T18:58:12Z');
INSERT INTO bookings (user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (2, 2, '2023-05-18T04:07:48Z', '2023-09-30T01:59:43Z', TRUE, '2021-03-20T09:54:43Z');
INSERT INTO bookings (user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (4, 4, '2023-01-29T12:08:21Z', '2023-10-22T02:22:25Z', TRUE, '2021-01-30T17:27:16Z');
INSERT INTO bookings (user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (5, 3, '2023-01-15T14:09:10Z', '2023-12-19T02:19:59Z', FALSE, '2021-03-23T06:36:38Z');
INSERT INTO bookings (user_id, space_id, booking_start_date, booking_end_date, booking_approved,
                      booking_created_date)
VALUES (1, 5, '2023-03-08T13:15:31Z', '2023-09-16T22:02:41Z', FALSE, '2021-03-13T23:46:45Z');
