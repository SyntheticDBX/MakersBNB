feature 'User sign up' do
    scenario 'I can sign up as a new user' do
        expect { sign_up }.to change(User, :count).by(1)
        expect(User.first.email_address).to eq('ryantester@email.com')
    end

    scenario 'User can log out after signing up' do
        sign_up
        click_button 'Log out'
        expect(page).to have_content('You have logged out')
        expect(page).not_to have_content('Welcome, Ryan')
    end
end

feature 'User cannot sign up with incorrect details' do
    scenario 'cannot sign up without email address' do
        expect { sign_up(email_address: nil) }.not_to change(User, :count)
    end

    scenario 'cannot sign up with invalid email address' do
        expect { sign_up(email_address: 'test') }.not_to change(User, :count)
    end

    scenario 'cannot sign up with different passwords' do
        expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
        expect(current_path).to eq('/users/new')
        expect(page).to have_content 'Passwords do no match'
    end

    scenario 'cannot sign up with an email address that is already registered' do
        sign_up
        expect { sign_up }.not_to change(User, :count)
        expect(page).to have_content 'Email address is already taken'
    end

    scenario 'cannot sign up with an username that is already registered' do
        sign_up
        expect { sign_up(email_address: 'ryantester@email.com') }.not_to change(User, :count)
        expect(page).to have_content 'Username is already taken'
    end
end

feature 'User sign in' do
    let!(:user) do
        User.create(username: 'ryantester', first_name: 'Ryan', surname: 'Tester', email_address: 'ryantester@email.com', password: 'password123')
    end

    scenario 'user can log in with correct details' do
        sign_in(email_address: user.email_address, password: user.password)
        expect(page).to have_content "Welcome, #{user.username}"
    end
end