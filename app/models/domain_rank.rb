class DomainRank < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  #Puntos: S=S+(C+E+Q)/3
  validates_inclusion_of :level, in: 0..5741
  validates :level, presence: true

  validates_uniqueness_of :user, :scope => [:topic]


  def self.load_domain_ranks(page = 1, per_page = 10)
  	includes(topic: [:tags], user:[:rank, :questions])
    .paginate(:page => page,:per_page => per_page)
  end

  def self.domain_rank_by_id(id)
    includes(topic: [:tags], user:[:rank, :questions])
    .find_by_id(id)
  end

  def self.domain_ranks_by_ids(ids, page = 1, per_page = 10)
    load_domain_ranks(page, per_page)
      .where( domain_ranks: {id: ids})
  end

  def self.domain_ranks_by_user_id( id, page = 1, per_page = 10)
     where( domain_ranks: {user_id: id})
     .paginate(:page => page,:per_page => per_page)
  end

  def self.domain_ranks_by_user_id_and_topic( uid, tid )
    joins( :topic )
    .where( domain_ranks: {user_id: uid, topic_id: tid})
    .select('level, topic_id, topics.topic_name')
  end


end
