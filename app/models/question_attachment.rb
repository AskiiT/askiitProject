class QuestionAttachment < ApplicationRecord
  belongs_to :question

  has_attached_file :attachment, styles: { medium: "1280x720", thumb: "800x600", mini: "400x200" }
  #Validates ONLY (so far) image's data types.
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def self.load_question_attachments
    includes(question:[:user, :topic, :question_has_tags])
  end

  def self.que_attachment_by_id(id)
    includes(question:[:user, :topic, :question_has_tags])
    .find_by_id(id)
  end


end
