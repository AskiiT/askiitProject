class TagSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :tag_name
  belongs_to :topic
end
