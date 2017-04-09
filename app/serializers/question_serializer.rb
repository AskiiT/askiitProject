class QuestionSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :title, :body, :difficulty, :date_posted
  belongs_to :topic
  has_many :tags
  belongs_to :user  
  has_many :p_users
  has_many :question_attachments
end
