class AddAttachToQuestionAttachments < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :question_attachments, :attachment
  end
end
