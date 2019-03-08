class Project < ApplicationRecord
  belongs_to :teamleader, class_name: 'User'
end
