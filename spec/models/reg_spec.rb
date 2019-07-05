require "rails_helper"

RSpec.describe User, :type => :model do
  
  before(:all) do
    @user = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "has a unique email" do
    user2 = build(:user, first_name: "Giovanni")
    expect(user2).to_not be_valid
  end

  it "has a unique email" do
    user2 = build(:user, first_name: "Giovanni")
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password confirmation" do 
    user2 = build(:user, password_confirmation: nil)
    expect(user2).to_not be_valid
  end

end