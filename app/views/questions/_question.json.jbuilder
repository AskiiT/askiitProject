json.extract! question, :id, :title, :body, :date_posted, :difficulty, :user_id, :topic_id, :created_at, :updated_at
json.url question_url(question, format: :json)
