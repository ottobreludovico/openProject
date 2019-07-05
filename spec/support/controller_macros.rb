module ControllerMacros

    def login_user
        before(:each) do
            request.env["devise.mapping"] = Devise.mappings[:user_log]
            user = FactoryBot.creat(:user_log)
            sign_in user
        end
    end

end