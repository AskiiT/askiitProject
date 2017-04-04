class QuestionHasTagSerializer < ActiveModel::Serializer
  type 'data'
  belongs_to :question
  belongs_to :tag
end
