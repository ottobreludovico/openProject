require "rails_helper"


RSpec.describe ProjectsController, :type => :controller do

    before(:all) do 
        @user = FactoryBot.create(:user)
    end

    it "create" do

        sign_in @user

        @project = Project.new(
                              :id => "1",
                              :teamleader_id => @user.id,
                              :title => "IOS project", 
                              :description => "This is my first project on this web site.........",
                              :number_of_member => "3",
                              :created_at => DateTime.now,
                              :updated_at => DateTime.now)
        expect(@project).to be_valid

    end

    it "is not valid because user's role must be 1" do
        user2 = FactoryBot.build(:user, :role => 0)
        project2 = Project.new(:teamleader_id => user2.id,
                               :title => "IOS project", 
                               :description => "This is my first project on this web site.........",
                               :number_of_member => "3",
                               :created_at => DateTime.now,
                               :updated_at => DateTime.now)
        expect(project2).to_not be_valid
    end

    it "is not valid without a title" do 
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => nil, 
                               :description => "This is my first project on this web site.........",
                               :number_of_member => "3",
                               :created_at => DateTime.now,
                               :updated_at => DateTime.now)
        expect(project2).to_not be_valid
    end

    it "is not valid without a description" do 
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => "IOS project", 
                               :description => nil,
                               :number_of_member => "3",
                               :created_at => DateTime.now,
                               :updated_at => DateTime.now)
        expect(project2).to_not be_valid
    end

    it "is not valid with short description" do
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => "IOS project", 
                               :description => "c",
                               :number_of_member => "3",
                               :created_at => DateTime.now,
                               :updated_at => DateTime.now)
        expect(project2).to_not be_valid
    end

    it "is not valid with long title" do
        project2 = Project.new(:teamleader_id => @user.id,
                               :title => "This is my first project on this web site.........", 
                               :description => "This is my first project on this web site.........",
                               :number_of_member => "3",
                               :created_at => DateTime.now,
                               :updated_at => DateTime.now)
        expect(project2).to_not be_valid
    end

    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response).to render_template :index
        end
    end

    describe "GET #new" do
        
        before do
            sign_in @user
        end

        context "is a logged advancer_user" do
            it "renders the :new view" do
                get :new
                expect(response).to render_template :new
            end
        end

    end

    describe "GET #edit" do
        before do
            @project = Project.new(
                              :id => "1",
                              :teamleader_id => @user.id,
                              :title => "IOS project", 
                              :description => "This is my first project on this web site.........",
                              :number_of_member => "3",
                              :created_at => DateTime.now,
                              :updated_at => DateTime.now)
            sign_in @user
        end

        context "is a logged advancer_user" do
            it "renders the :edit view" do
                get :edit, params: { id: @project.id }
                expect(response).to render_template :edit
            end
        end
    end

    describe "GET #show" do

        before do
            @project = Project.new(
                              :id => "1",
                              :teamleader_id => @user.id,
                              :title => "IOS project", 
                              :description => "This is my first project on this web site.........",
                              :number_of_member => "3",
                              :created_at => DateTime.now,
                              :updated_at => DateTime.now)
            sign_in @user
        end

        it "renders the :show" do 
            get :show, params: { id: @project }
            expect(response).to render_template :show
        end
    end

    describe "PUT #update" do

        let(:attr) do 
            { :title => 'Another_title' }
        end

        before do
            @project = Project.new(
                            :id => "1",
                            :teamleader_id => @user.id,
                            :title => "IOS project", 
                            :description => "This is my first project on this web site.........",
                            :number_of_member => "3",
                            :created_at => DateTime.now,
                            :updated_at => DateTime.now)
            sign_in @user
        end

        context "is advancer_user" do

        
            it "changes @project's attributes" do
                put :update, params: { id: @project, project: attr }
                @project.reload
                expect(@project.title).to eq("Another_title")
            end

        end
    end

end