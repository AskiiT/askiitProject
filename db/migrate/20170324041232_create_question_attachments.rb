class CreateQuestionAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :question_attachments do |t|
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
