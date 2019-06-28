class ChatMessage < ApplicationRecord
  belongs_to :project, class_name: 'Project'
  belongs_to :user, class_name: 'User'
  validates :body, presence: true
end
