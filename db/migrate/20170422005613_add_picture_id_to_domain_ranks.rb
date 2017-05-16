class AddPictureIdToDomainRanks < ActiveRecord::Migration[5.0]
  def change
    add_reference :domain_ranks, :picture, foreign_key: true
  end
end
