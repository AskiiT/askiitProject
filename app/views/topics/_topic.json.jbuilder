json.extract! topic, :id, :topic_name, :topic_description, :created_at, :updated_at
json.url topic_url(topic, format: :json)
