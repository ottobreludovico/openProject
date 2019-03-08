class UserStory < ApplicationRecord
  belongs_to :project, class_name: 'Project' 
  belongs_to :creator, class_name: 'User'
  belongs_to :worker, class_name: 'User'
end
