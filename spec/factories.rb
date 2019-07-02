FactoryBot.define do
  
    factory :user do
        first_name { 'Pino' }
        last_name { 'Rossi' }
        email { 'mario.ros@libero.it' }
        password { 'miapassword' }
        password_confirmation { 'miapassword' }
    end

end