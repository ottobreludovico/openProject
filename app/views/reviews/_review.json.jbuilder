json.extract! review, :id, :creator_id, :assigned_to_id, :project_id, :note, :skills, :created_at, :updated_at
json.url review_url(review, format: :json)
