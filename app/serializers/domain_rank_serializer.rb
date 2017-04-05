class DomainRankSerializer < ActiveModel::Serializer
  type 'data'
  attributes :level
  belongs_to :topic
end
