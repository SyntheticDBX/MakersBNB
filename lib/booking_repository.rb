require 'booking'

class BookingRepository
    def all
        bookings = []

        sql = 'SELECT * FROM bookings;'
        params = []

        result_set = DatabaseConnection.exec_params(sql, params)
        result_set.each do |item|
            booking = Booking.new
            booking.id = item["id"].to_i
            booking.booking_start_date = item["booking_start_date"]
            booking.booking_end_date = item["booking_end_date"]
            booking.user_id = item["user_id"].to_i
            booking.space_id = item["space_id"].to_i
            booking.booking_approved = item["booking_approved"]
            booking.booking_created_date = item["booking_created_date"]
            bookings << booking
        end
        return bookings
    end

    def find(id)
        sql = 'SELECT * FROM bookings WHERE id = $1'
        params = [id]
        item = DatabaseConnection.exec_params(sql, params)
        booking = Booking.new
        booking.id = item[0]["id"].to_i
        booking.booking_start_date = item[0]["booking_start_date"]
        booking.booking_end_date = item[0]["booking_end_date"]
        booking.user_id = item[0]["user_id"].to_i
        booking.space_id = item[0]["space_id"].to_i
        booking.booking_approved = item[0]["booking_approved"]
        booking.booking_created_date = item[0]["booking_created_date"]
        return booking
    end

    def create(booking)
        sql = 'INSERT INTO bookings (booking_start_date, booking_end_date, user_id, space_id, booking_approved, booking_created_date) VALUES ($1, $2, $3, $4, $5, $6)'
        params = [booking.booking_start_date, booking.booking_end_date, booking.user_id, booking.space_id,  booking.booking_approved, booking.booking_created_date  ]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end
end