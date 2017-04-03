class AddAttachmentToQuestionAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :question_attachments, :attachment, :string
  end
end
