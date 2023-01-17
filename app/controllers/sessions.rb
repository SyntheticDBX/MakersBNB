class MakersBnB < Sinatra::Base
    delete '/sessions' do
        session[:user_id] = nil
        flash[:notice] = 'You have signed out'
        redirect '/spaces'
    end

    get '/sessions/new' do
        erb :'sessions/new'
    end

    post '/sessions' do
        user = User.authenticate(params[:email_address], params[:password])
        if user
            session[:user_id] = user.id
            redirect '/spaces'
        else
            flash[:notice] = 'Incorrect email or password'
            redirect '/sessions/new'
        end
    end

    get '/sessions/spaces/:name' do
        spaces = Spaces.first(:name => params[:name])
        session[:space_id] = spaces.id
        redirect to("/spaces/#{params[:name]}")
    end
end

