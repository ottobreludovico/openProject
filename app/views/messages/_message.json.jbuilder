json.extract! message, :id, :project_id, :creator_id, :msg, :created_at, :updated_at
json.url message_url(message, format: :json)
