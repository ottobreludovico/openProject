class Review < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'
  belongs_to :project, class_name: 'Project'
end
