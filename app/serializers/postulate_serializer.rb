class PostulateSerializer < ActiveModel::Serializer
  type 'data'
  belongs_to :user
  belongs_to :question
end
