class MakersBnB < Sinatra::Base
    post '/users/new' do
        user = User.create(username: params[:username], first_name: params[:first_name], surname: params[:surname], email_address: params[:email_address], password: params[:password])
        if user.save
            session[:user_id] = user.id
            redirect '/spaces'
        else
            flash[:errors] = user.errors.full_messages
            erb :index
        end
    end

    get '/users/new' do
        erb :index
    end
end