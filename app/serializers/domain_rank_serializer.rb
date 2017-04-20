class DomainRankSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :level, :topic_id
  belongs_to :topic
end
