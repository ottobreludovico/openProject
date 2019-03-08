json.extract! user_story, :id, :creator_id, :worker_id, :title, :description, :deadline, :state, :created_at, :updated_at
json.url user_story_url(user_story, format: :json)
