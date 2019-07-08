FactoryBot.define do
  
    factory :user do
        first_name { 'Pino' }
        last_name { 'Rossi' }
        email { 'mario.rossi.129@libero.it' }
        password { 'miapassword' }
        password_confirmation { 'miapassword' }
        role { 1 }
    end

end