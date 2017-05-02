require 'securerandom'
lvl0=Avatar.new(:avatars=> File.new("#{Rails.root}/public/robot/robots/lvl1.png"))
lvl0.save
14.times do |j|
	i=j+1
	gen=Avatar.new(:avatars=> File.new("#{Rails.root}/public/robot/gen/"+i.to_s+".png"))
	gen.save
end

lvl1=Picture.new(:level_picture=> File.new("#{Rails.root}/public/robot/robots/lvl1.png"))
lvl1.id=1
lvl1.save

lvl3=Picture.new(:level_picture=> File.new("#{Rails.root}/public/robot/robots/lvl3.png"))
lvl3.id=3
lvl3.save

lvl5=Picture.new(:level_picture=> File.new("#{Rails.root}/public/robot/robots/lvl5.png"))
lvl5.id=5
lvl5.save

10.times do |j|
	m=j+1
	lvl7='70'+m.to_s
	route="#{Rails.root}/public/robot/robots/lvl7/r"+m.to_s+".png"
	lvl7=lvl7.to_i

	lvlP=Picture.new(:level_picture=> File.new(route))
	lvlP.id=lvl7
	lvlP.save
end

10.times do |j|
	m=j+1
	lvl9='90'+m.to_s
	route="#{Rails.root}/public/robot/robots/lvl9/r"+m.to_s+".png"
	lvl9=lvl9.to_i

	lvlP=Picture.new(:level_picture=> File.new(route))
	lvlP.id=lvl9
	lvlP.save
end


colors=[
'#E73434',
'#FFAA2A',
'#B0E940',
'#16E978',
'#25C8F1',
'#616FD5',
'#C373BB',
'#33335C',
'#03461D',
'#460337']


t=Topic.new
t.id=1
t.topic_name="Artes Musicales"
t.topic_description="Pregunta sobre Artes Musicales"
t.color=colors[7]
t.save

t=Topic.new
t.id=2
t.topic_name="Artes Plasticas"
t.topic_description="Pregunta sobre Artes Plasticas"
t.color=colors[8]
t.save

t=Topic.new
t.id=3
t.topic_name="Biologia"
t.topic_description="Pregunta sobre Biologia"
t.color=colors[0]
t.save

t=Topic.new
t.id=4
t.topic_name="Ciencias Sociales"
t.topic_description="Pregunta sobre Ciencias Sociales"
t.color=colors[6]
t.save

t=Topic.new
t.id=5
t.topic_name="Computacion e Informatica"
t.topic_description="Pregunta sobre Computacion e Informatica"
t.color=colors[2]
t.save

t=Topic.new
t.id=6
t.topic_name="Electricidad y Electronica"
t.topic_description="Pregunta sobre Electricidad y Electronica"
t.color=colors[5]
t.save

t=Topic.new
t.id=7
t.topic_name="Fisica"
t.topic_description="Pregunta sobre Fisica"
t.color=colors[4]
t.save

t=Topic.new
t.id=8
t.topic_name="Lenguaje y Literatura"
t.topic_description="Pregunta sobre Lenguaje y Literatura"
t.color=colors[9]
t.save

t=Topic.new
t.id=9
t.topic_name="Matematica"
t.topic_description="Pregunta sobre Matematica"
t.color=colors[3]
t.save

t=Topic.new
t.id=10
t.topic_name="Quimica"
t.topic_description="Pregunta sobre quimica"
t.color=colors[1]
t.save



100.times do |i|
	u= User.new
	u.first_name= Faker::Name.first_name
	u.last_name= Faker::Name.last_name
	u.date_created = Date.today - Faker::Number.number(3).to_i.days 
	u.email=Faker::Internet.email
	us=[u.first_name[0,3]+i.to_s+u.last_name[0,3], u.last_name[0,2].upcase+u.first_name+i.to_s, u.first_name[0,3]+u.last_name[0,3]+i.to_s]
	userCho=rand(0..2);
	u.username=us[userCho]
	u.password="12345678"
	u.description= Faker::Lorem.paragraph
	color_index=rand(0..10)
	u.color=SecureRandom.hex(3)
	u.color="#"+u.color.upcase;
	newb=rand(0.0..10.0)
	u.avatar_id=1
	if newb>3.5 
		u.avatar_id=rand(1..15);
	end
	until u.valid? do
		u.first_name= Faker::Name.first_name
		u.last_name= Faker::Name.last_name
		u.date_created = Date.today - Faker::Number.number(3).to_i.days 
		u.email=Faker::Internet.email
		us=[u.first_name[0,3]+i.to_s+u.last_name[0,3], u.last_name[0,2].upcase+u.first_name+i.to_s, u.first_name[0,2]+u.last_name[0,3]+i.to_s]
		userCho=rand(0..2)
		u.username=us[userCho]
		u.password="12345678"
		u.description= Faker::Lorem.paragraph
		color_index=rand(0..10)
		u.color=SecureRandom.hex(3)
		u.color="#"+u.color.upcase;
	end
	u.save
	u=User.all.last
	u.date_created = DateTime.now - Faker::Number.number(3).to_i.days - Faker::Number.number(3).to_i.hours
	u.save
	r=Rank.last
	r.clarity=rand(0..5741)
	r.quickness=rand(0..5741)
	r.efectiveness=rand(0..5741)
	r.save
	user_id=User.all.last.id
	for j in 1..10 do
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
  		 	dr=DomainRank.find_by_id((user_id.to_s+'010'+j.to_s).to_i)
			#dr.level=rand(0..5741)
			prob=rand(0..100)
			if prob < 30
				dr.level=rand(0...56)
			elsif prob < 50
				dr.level=rand(56...214)
			elsif prob < 70
				dr.level=rand(214...667)
			elsif prob < 90
				dr.level=rand(667...1973)
			else
				dr.level=rand(1973...3368)
			end
		 	dr.save
 	end
	# t= Topic.new
	# t.topic_name= Faker::Address.city
	# t.topic_name= t.topic_name.upcase
	# t.topic_description= Faker::Company.catch_phrase
	# t.color= "%06x" % (rand * 0xffffff)


	# until t.valid? do
	# 	t= Topic.new
	# 	t.topic_name= Faker::Address.city
	# 	t.topic_name= t.topic_name.upcase
	# 	t.topic_description= Faker::Company.catch_phrase
	# 	t.topic_color= "%06x" % (rand * 0xffffff)
	# end
	# t.save
end




300.times do |i|
 ta=Tag.new

 ta.tag_name=Faker::Company.catch_phrase
 ta.tag_name=ta.tag_name.upcase
 
	until ta.valid? do	
	 ta.tag_name=Faker::Company.catch_phrase
	 ta.tag_name=ta.tag_name.upcase
	end
 ta.save

 #  ta.tag_name=Faker::Team.name

end



300.times do |i|
 q=Question.new
 q.title= Faker::Lorem.sentence
 q.body= Faker::Lorem.paragraph
 q.difficulty=rand(1..10)
 q.topic_id=rand(1..10)
 q.user_id=rand(1..100)
 q.end_time= DateTime.now+9999.to_i.minutes;
 until q.valid? do	
	 q.title= Faker::Lorem.sentence
	 q.body= Faker::Lorem.paragraph
	 q.date_posted= 
	 q.difficulty=rand(1..10)
	 q.topic_id=rand(1..10)
	 q.user_id=rand(1..100)
 end

 q.save
 tags_amount=rand(0..3)
 question_id=Question.all.last.id

	if tags_amount !=0
		for j in 1..tags_amount do
			t=QuestionHasTag.new
			tag_id=rand(1..300)
			t.question_id=question_id
			t.tag_id=tag_id

		 	until t.valid? do
				tag_id=rand(1..300)
				t.tag_id=tag_id
	 		end
	 		t.save
		end
	end

end

500.times do |i|
	f=Follower.new
	f.followed_id=rand(1..100)
	f.follower_id=rand(1..100)
	until f.valid? do	
		f.followed_id=rand(1..100)
		f.follower_id=rand(1..100)
	end
	f.save
end

900.times do |i|
 t=Postulate.new
 t.question_id=rand(1..300)
 t.user_id=rand(1..100)
 until t.valid? do
 	t.user_id=rand(1..100)
 end
 t.save
end

100.times do |i|
 at=QuestionAttachment.new
 at.question_id=rand(1..300)
 at.save
end

# 500.times do |i|
# 	dr=DomainRank.new
# 	dr.user_id=rand(1..150)
# 	dr.topic_id=rand(1..150)
# 	dr.level=rand(0..5741)
# 	dr.save
# end


## 700.times do |i|
##  t=QuestionHasTag.new
##  question_id=rand(1..300)
##  tag_id=rand(1..300)
##  t.question_id=question_id
##  t.tag_id=tag_id

##  until t.valid? do
## 	question_id=rand(1..300)
## 	tapg_id=rand(1..300)
## 	t.question_id=question_id
## 	t.tag_id=tag_id
##  end
##  t.save
## end