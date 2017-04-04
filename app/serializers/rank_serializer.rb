class RankSerializer < ActiveModel::Serializer
  type 'data'
  attributes :clarity, :quickness, :efectiveness
  belongs_to :user
end
