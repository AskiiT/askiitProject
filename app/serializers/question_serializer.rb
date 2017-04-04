class QuestionSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :title, :body, :difficulty
  belongs_to :user
  has_many :p_users
end
