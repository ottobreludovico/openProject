FactoryBot.define do
  
    factory :user do
        first_name { 'Name' }
        last_name { 'Surname' }
        email { 'user1@user.it' }
        password { 'password' }
        password_confirmation { 'password' }
        role { 1 }
    end

end