json.extract! question_has_tag, :id, :question_id, :tag_id, :created_at, :updated_at
json.url question_has_tag_url(question_has_tag, format: :json)
