Given("I am a logged in user") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test'})
    @current_user = @user
    login(@user.email, 'lol.123')
end

Given("I am an admin") do
    @user = User.create!(:email => 'admin@user.com', :password => 'passpass', :admin => true)
    @current_user = @user
    login(@user.email, 'passpass')
end

Given("I am another logged in user") do
    @user = User.create!(:email => 'otheruser@user.com', :password => 'passpass')
    @current_user = @user
    login(@user.email, 'passpass')
end

Given("I am a guest user") do
end

module LoginSteps
    def login(email, password)
        visit('/users/sign_in')
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        click_button('Log in')
    end
end
  
  World(LoginSteps)