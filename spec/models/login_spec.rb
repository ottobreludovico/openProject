require "rails_helper"
require_relative "../support/devise"

RSpec.describe User, :type => :controller do
  login_user

    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect( response ).to render_template :index
        end
    end
end