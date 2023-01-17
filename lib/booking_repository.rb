require 'booking'

class BookingRepository
    def all
        bookings = []

        sql = 'SELECT * FROM bookings;'
        params = []

        result_set = DatabaseConnection.exec_params(sql, params)
        result_set.each do |item|
            booking = Booking.new
            booking.id = item.id.to_i
            booking.start_date = item.start_date
            booking.end_date = item.end_date
            booking.user_id = item.user_id.to_i
            booking.space_id = item.space_id.to_i
            booking.booking_approved = item.booking_approved
            booking.booking_created = item.booking_created
            bookings << booking
        end
        return bookings
    end

    def find(id)
        sql = 'SELECT * FROM bookings WHERE id = $1'
        params = [id]
        result_set = DatabaseConnection.exec_params(sql, params)
        booking = Booking.new
        booking.id = item.id.to_i
        booking.start_date = item.start_date
        booking.end_date = item.end_date
        booking.user_id = item.user_id.to_i
        booking.space_id = item.space_id.to_i
        booking.booking_approved = item.booking_approved
        booking.booking_created = item.booking_created
        return booking
    end

    def create(booking)
        sql = 'INSERT INTO bookings (start_date, end_date, user_id, space_id, booking_approved, booking_created) VALUES ($1, $2, $3, $4, $5, $6)'
        params = [booking.start_date, booking.end_date, booking.user_id, booking.space_id,  booking.booking_approved, booking.booking_created  ]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end
end