class AddEndTimeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :end_time, :datetime, :default=> DateTime.now+999.to_i.minutes
  end
end
