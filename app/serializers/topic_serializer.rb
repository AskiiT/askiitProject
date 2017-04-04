class TopicSerializer < ActiveModel::Serializer
  type 'data'
  attributes :topic_name, :topic_description
end
