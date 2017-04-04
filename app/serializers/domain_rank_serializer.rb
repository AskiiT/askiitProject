class DomainRankSerializer < ActiveModel::Serializer
  type 'data'
  attributes :level
  belongs_to :user
  belongs_to :topic
end
