FactoryBot.define do
  
    factory :user do
        first_name { 'Pino' }
        last_name { 'Rossi' }
        email { 'mario.rossi.1988@libero.it' }
        password { 'miapassword' }
        password_confirmation { 'miapassword' }
    end

    factory :user_log do
        email { 'mario.ros@libero.it' }
        password { 'miapassword' }
    end

end