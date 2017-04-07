class TopicSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :topic_name, :topic_description
end
