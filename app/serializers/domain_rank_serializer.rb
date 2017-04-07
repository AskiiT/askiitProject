class DomainRankSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :level
  belongs_to :topic
end
