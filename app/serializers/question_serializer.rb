class QuestionSerializer < ActiveModel::Serializer
  type 'data'
  attributes :title, :body, :difficulty, :date_posted
  belongs_to :user
  belongs_to :topic
  has_many :p_users
end
