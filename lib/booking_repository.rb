require_relative './booking'
require_relative './database_connection'
class BookingRepository
    def all
        params = []
        sql = 'SELECT * FROM bookings;'
        result_set = DatabaseConnection.exec_params(sql, params)
        result_set.map { | booking_hash | Booking.new(booking_hash)}
    end

    def find(id)
        sql = 'SELECT * FROM bookings WHERE id = $1'
        params = [id]
        bookings_array = DatabaseConnection.exec_params(sql, params)
        bookings_array.map { | booking_hash | Booking.new(booking_hash)}.first
    end

    def create(booking)
        sql = 'INSERT INTO bookings (booking_start_date, booking_end_date, user_id, space_id, booking_approved, booking_created_date) VALUES ($1, $2, $3, $4, $5, $6)'
        params = [booking.booking_start_date, booking.booking_end_date, booking.user_id, booking.space_id,  booking.booking_approved, booking.booking_created_date  ]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end
end