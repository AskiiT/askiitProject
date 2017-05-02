class AddQuestionIdToNotification < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :question, foreign_key: true
  end
end
