class User < ActiveRecord::Base
    has_secure_password
    validates :username,  presence: true, length: { maximum: 30 }, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }

    has_many :projects
end
