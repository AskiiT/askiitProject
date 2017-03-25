class DomainRank < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  #Puntos: S=S+(C+E+Q)/3
  validates_inclusion_of :level, in: 0..5741
  validates :level, presence: true

  validates_uniqueness_of :user, :scope => [:topic]
  def self.load_domain_ranks
  	includes(topic: [:tags], user:[:rank, :questions])
  end
end
