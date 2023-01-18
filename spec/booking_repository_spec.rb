require 'booking_repository'
require 'date'

def reset_bookings_table
    seed_sql = File.read('spec/booking_seeds.sql')
    connection = PG.connect({host: '127.0.0.1', dbname: 'makersbnb_test'})
    connection.exec(seed_sql)
end

describe BookingRepository do
    before(:each) do
        reset_bookings_table
    end

    it 'returns all bookings' do
        repo = BookingRepository.new
        bookings = repo.all
        expect(bookings.length).to eq 5
        expect(bookings.first.user_id).to eq 4
        expect(bookings.last.space_id).to eq 1
    end

    it 'finds a booking by id' do
        repo = BookingRepository.new
        booking = repo.find(2)
        expect(booking.space_id).to eq 5
        booking = repo.find(1)
        expect(booking.booking_start_date).to eq '2023-01-09'
    end

    it 'creates a new booking' do
        repo = BookingRepository.new
        booking = Booking.new
        booking.booking_start_date = "2023-01-14"
        booking.booking_end_date = "2023-01-16"
        booking.user_id = 4
        booking.space_id = 3
        booking.booking_approved = false
        booking.booking_created_date = Date.today
        repo.create(booking)
        booking = repo.all
        expect(booking.length).to eq 6
        expect(booking.last.booking_end_date).to eq "2023-01-16"
    end

    # it 'retrieves users encrypted password from email' do
    #     repo = UserRepository.new
    #     user = repo.find_by_email('mr_robinson@thisemail.com')
    #     expect(user.password).to eq 'somepassword'
    # end
end