class FollowerSerializer < ActiveModel::Serializer
  type 'data'
  belongs_to :followed
  belongs_to :follower
end
