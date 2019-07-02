require "rails_helper"

RSpec.describe User, :type => :model do
    before(:all) do
        @user = create(:user)
    end

    it "create" do

        project = Project.new(:teamleader_id => @user.id,
                              :title => "IOS project", 
                              :description => "This is my first project on this web site.........",
                              :number_of_member => "3")
        expect(project).to be_valid

    end

    it "is not valid without a title" do 
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => nil, 
                               :description => "This is my first project on this web site.........",
                               :number_of_member => "3")
        expect(project2).to_not be_valid
    end

    it "is not valid without a description" do 
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => "IOS project", 
                               :description => nil,
                               :number_of_member => "3")
        expect(project2).to_not be_valid
    end


end