Given("I am on my project page") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test', :role => 1})
    @current_user = @user
    login(@user.email, 'lol.123')
    @project = Project.create!({:title => 'title', :description => 'Description Description Description Description Description Description Description Description Description Description ', :number_of_member => 5, :teamleader_id => @user.id})
    visit project_path(@project.id)
end

When("I reload my project page") do 
    visit project_path(1)
end

When("I click Update User Story") do 
    find('input[name="commit"]').click
end

Given("I am on the user_stories page") do
    visit user_stories_path
end

Then("I should see {string} body") do |string|
    expect(page.source).to have_content(string)
end

Given("I am on the home page as logged user") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test', :role => 1})
    @current_user = @user
    login(@user.email, 'lol.123')
    visit home_path
end

Given("I am on my project page with 1 user story") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test', :role => 1})
    @current_user = @user
    login(@user.email, 'lol.123')
    @project = Project.create!({:title => 'title', :description => 'Description Description Description Description Description Description Description Description Description Description ', :number_of_member => 5, :teamleader_id => @user.id})
    @user_Story=UserStory.create!({:project_id => @project.id , :title => 'Titolo', :description => 'Descrizione', :creator_id => @user.id, :state => 0})
    visit project_path(@project.id)
end
