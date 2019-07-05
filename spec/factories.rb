FactoryBot.define do
  
    factory :user do
        first_name { 'Pino' }
        last_name { 'Rossi' }
        email { 'mario.rossi.2002@libero.it' }
        password { 'miapassword' }
        password_confirmation { 'miapassword' }
        role { 1 }
    end

    factory :user_log do
        email { 'mario.ros@libero.it' }
        password { 'miapassword' }
    end

end