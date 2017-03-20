class CreateDomainRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :domain_ranks do |t|
      t.integer :level
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
