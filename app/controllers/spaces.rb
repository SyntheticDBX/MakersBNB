class MakersBnB < Sinatra::Base
    get '/spaces' do
        @spaces = Spaces.all
        erb :spaces
    end

    get '/spaces/new' do
        erb :new_space
    end

    post '/spaces/new' do
        spaces = Spaces.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to])
        spaces.user = current_user

        if !spaces.save
            flash[:errors] = ['Must be logged in to create a space']
            redirect '/'
        else
            spaces.save
            redirect '/spaces'
        end
    end

    get '/spaces/:name' do
        @spaces = Spaces.first(:name => params[:name])
        erb :space
    end
end
