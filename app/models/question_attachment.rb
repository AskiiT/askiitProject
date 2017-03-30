class QuestionAttachment < ApplicationRecord
  belongs_to :question

  has_attached_file :attachment, styles: { medium: "1280x720", thumb: "800x600", mini: "400x200" }
  #Validates ONLY (so far) image's data types.
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def self.load_question_attachments(page = 1, per_page = 10)
    includes(question:[:user, :topic, :question_has_tags])
      .paginate(:page => page,:per_page => per_page)
  end

  def self.que_attachment_by_id(id)
    includes(question:[:user, :topic, :question_has_tags])
    .find_by_id(id)
  end

  def self.get_attachments( id , page = 1, per_page = 10)
    joins( :question ).where( "question_id = ?", id )
    .paginate(:page => page,:per_page => per_page)
  end


end
