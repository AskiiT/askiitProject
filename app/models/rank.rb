class Rank < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  #Cada uno se califica de 1 a 5 por pregunta.
  #Por la dificultad de E=E+Calificacion*(Dificultad)
  validates_inclusion_of :clarity, in: 0..5741
  validates_inclusion_of :efectiveness, in: 0..5741
  validates_inclusion_of :quickness, in: 0..5741
  validates :clarity, :efectiveness, :quickness, presence: true
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

  def self.load_ranks
    includes(user:[:domain_ranks, :questions])
  end

  def self.rank_by_id(id)
    includes(user:[:domain_ranks, :questions])
    .find_by_id(id)
  end

  #Me retorna el rank de un usuario dado
  def self.rank_of_user(user)
    load_ranks.joins(:user).where(rank:{user_id: user})
  end

end