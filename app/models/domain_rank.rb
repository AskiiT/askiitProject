class DomainRank < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  belongs_to :picture
  #Puntos: S=S+(C+E+Q)/3
  validates_inclusion_of :level, in: 0..5741
  validates :level, presence: true

  validates_uniqueness_of :user, :scope => [:topic]
  after_initialize :def_picture
  before_save :sett_picture

  def def_picture
    self.picture ||= Picture.find_by_id(1)
  end

  def sett_picture
      #Lv1: 0-20
      #Lv2: 21-55
      #Lv3: 56-114
      #Lv4: 115-213
      #Lv5: 214-381
      #Lv6: 382-666
      #Lv7: 667-1150
      #Lv8: 1151-1972
      #Lv9: 1973-3368
      #Lv10: 3369-5740
      #MAX > 5741
      lvl=self.level
      top=self.topic_id
      lvl=lvl.to_i
      if lvl<56
        self.picture = Picture.find_by_id(1)
      elsif lvl<214
        self.picture = Picture.find_by_id(3)
      elsif lvl<667
        self.picture = Picture.find_by_id(5)
      elsif lvl<1973
        tplvl= "70"+top.to_s
        #print "El nivel actual es: "+tplvl+"\n\n"
        tplvl= tplvl.to_i
        
        self.picture = Picture.find_by_id(tplvl)
      elsif lvl < 3369
        tplvl= "90"+top.to_s
        #print "El nivel actual es: "+tplvl+"\n\n"
        tplvl= tplvl.to_i
        
        self.picture = Picture.find_by_id(tplvl)
      else
        tplvl= "100"+top.to_s
        #print "El nivel actual es: "+tplvl+"\n\n"
        tplvl= tplvl.to_i
        
        self.picture = Picture.find_by_id(tplvl)
      end
        
  end

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
  end


end
