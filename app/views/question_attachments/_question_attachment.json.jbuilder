json.extract! question_attachment, :id, :question_id, :created_at, :updated_at
json.url question_attachment_url(question_attachment, format: :json)
