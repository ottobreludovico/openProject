class UserStory < ApplicationRecord
  belongs_to :project, foreign_key: 'project_id' ,class_name: 'Project' 
  belongs_to :creator, class_name: 'User'
  belongs_to :worker, class_name: 'User', optional: true

  def self.search(search)
    if search
      where('project_id = ?','search')
    else
      []
    end
  end


end