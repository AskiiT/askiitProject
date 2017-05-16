class AvatarSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :avatars
end
