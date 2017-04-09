class AddTopicIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :topic, foreign_key: true
  end
end
