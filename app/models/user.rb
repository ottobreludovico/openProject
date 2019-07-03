class User < ApplicationRecord

  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  
  enum role: [:user, :advanceduser, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :projects, foreign_key: 'teamleader_id'
  has_many :joins

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name
      user.uid = auth.uid
      user.email =auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def set_default_role
    self.role ||= :user
  end

  def set_admin_role
    self.role ||= :admin
  end

  def set_advanceduser_role
    self.role ||= :advanceduser
  end

end
