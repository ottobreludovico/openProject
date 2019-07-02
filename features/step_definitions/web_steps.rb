    
Given("I am on the discussions page") do
    visit discussions_path
end

Given("I am on the login page") do
    @user = User.create!({:email => 'test@lol.com', :password => 'lol.123', :password_confirmation => 'lol.123', :first_name => 'test', :last_name => 'test', :description => 'Desc test'})
    visit login_path
end

Given("I am on the home page") do
    visit home_path
end

Given("there is at least a discussion") do
    discussion = Discussion.create!(:title => 'Test title', :body => 'Test body')
    expect(discussion).not_to be_nil
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

Then("I should see {string}") do |string|
    expect(page).to have_content(string)
end

Then("I should not see {string}") do |string|
    expect(page).not_to have_content(string)
end

Then("I should see {string} css") do |string|
    expect(page).to have_css("." + string)
end