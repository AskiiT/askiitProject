class TagSerializer < ActiveModel::Serializer
  type 'data'
  attributes :tag_name
  belongs_to :topic
end
