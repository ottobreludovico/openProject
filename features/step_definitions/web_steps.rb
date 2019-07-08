Given("I am on the login page") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test'})
    visit login_path
end

Given("I am on the home page") do
    visit home_path
end

Given("I am on the project page") do
    @user = User.create!({:email => 'test2@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test'})
    @project = Project.create!({:teamleader_id => @user.id, :title => "Test Project", :description => "Test description Test description", :number_of_member => 5})
    visit project_path(@project.id)
end

Given("I am on the project chat page") do
    @user = User.create!({:email => 'test2@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'firstname', :last_name => 'lastname', :description => 'Desc test'})
    @project = Project.create!({:teamleader_id => @user.id, :title => "Test Project", :description => "Test description Test description", :number_of_member => 5})
    visit ("/projects/" + @project.id.to_s + "/chat")
end

Given("I am on the project page as teamleader") do
    @project = Project.create!({:teamleader_id => @current_user.id, :title => "Test Project", :description => "Test description Test description", :number_of_member => 5})
    visit project_path(@project.id)
end

Given ("I wait for {string} seconds") do |n|
  sleep(n.to_i)
end

When("I follow {string}") do |string|
    click_link(string)
end

When("I fill in {string} with {string}") do |name, value|
    fill_in name, with: value
end

When("I press {string}") do |string|
    click_button(string)
end

When ("I reload the page") do
  visit [ current_path, page.driver.request.env['QUERY_STRING'] ].reject(&:blank?).join('?')
end

Then("I should see {string}") do |string|
    expect(page).to have_content(string)
end

Then("I should not see {string}") do |string|
    expect(page).not_to have_content(string)
end

Then("I should see {string} css") do |string|
    expect(page).to have_css("." + string)
end