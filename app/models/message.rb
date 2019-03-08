class Message < ApplicationRecord

  belongs_to :project, class_name: 'Project'
  belongs_to :creator, class_name: 'User'
  validates :msg, presence: true
  
end
