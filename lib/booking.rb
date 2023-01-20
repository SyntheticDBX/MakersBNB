class Booking
    attr_accessor :id, :booking_start_date, :booking_end_date, :user_id, :space_id, :booking_approved, :booking_created_date

    def initialize(booking_hash)
@id = booking_hash["id"].to_i
@booking_start_date = booking_hash["booking_start_date"]
@booking_end_date = booking_hash["booking_end_date"]
@user_id = booking_hash["user_id"].to_i
@space_id = booking_hash["space_id"].to_i
@booking_approved = booking_hash["booking_approved"]
@booking_created_date = booking_hash["booking_created_date"]
    end
end