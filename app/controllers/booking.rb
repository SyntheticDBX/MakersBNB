class MakersBnB < Sinatra::Base
    post '/booking/new' do
        booking = Booking.new(booking_date: params[:booking_date], user_id: session[:user_id], space_id: session[:space_id])
        space = current_space
        booking.user = current_user
        booking.space = space

        if !booking.save
            flash[:errors] = ['Must be logged in to create a booking']
            redirect '/'
        else
            booking.save
            redirect '/booking'
        end
    end

    get '/booking' do
        @booking = Booking.all
        erb :booking
    end
end
