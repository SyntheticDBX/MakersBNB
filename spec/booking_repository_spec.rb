require 'booking_repository'

def reset_bookings_table
    seed_sql = File.read('spec/seeds.sql')
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
        expect(booking.space_id).to eq 4
        booking = repo.find(1)
        expect(booking.start_date).to eq '2023-01-09T02:45:57Z'
    end

    it 'creates a new booking' do
        repo = BookingRepository.new
        booking = Booking.new
        booking.start_date = "2023-01-14T04:50:43Z"
        booking.end_date = "2023-01-16T11:45:57Z"
        booking.user_id = 4
        booking.space_id = 1
        booking.booking_approved = false
        booking.booking_created = Datetime.now
        booking = repo.all
        expect(booking.length).to eq 6
        expect(booking.last.end_date).to eq "2023-01-16T11:45:57Z"
    end

    # it 'retrieves users encrypted password from email' do
    #     repo = UserRepository.new
    #     user = repo.find_by_email('mr_robinson@thisemail.com')
    #     expect(user.password).to eq 'somepassword'
    # end
end