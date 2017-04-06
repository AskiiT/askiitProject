150.times do |i|
	u= User.new
	u.first_name= Faker::Name.first_name
	u.last_name= Faker::Name.last_name
	u.date_created = Date.today - Faker::Number.number(3).to_i.days 
	u.email=Faker::Internet.email
	u.username=u.first_name+i.to_s+u.last_name
	u.password="12345678"
	u.description= Faker::Lorem.paragraph
	u.save

	t= Topic.new
	t.topic_name= Faker::Address.city
	t.description= Faker::Company.catch_phrase
	t.save


	r=Rank.new
 	r.id=u.id
	r.user_id=u.id
	r.clarity=rand(0..5741)
	r.quickness=rand(0..5741)
	r.efectiveness=rand(0..5741)
	r.save



end

500.times do |i|
 ta=Tag.new
 ta.tag_name=Faker::Commerce.department
 ta.topic_id=rand(1..150)
 ta.save
end

500.times do |i|
	f=Follower.new
	f.followed_id=rand(1..150)
	f.follower_id=rand(1..150)
	f.save
end

500.times do |i|
 q=Question.new
 q.title= Faker::Lorem.sentence
 q.body= Faker::Lorem.paragraph
 q.difficulty=rand(1..10)
 q.date_posted= Date.today - Faker::Number.number(3).to_i.days 
 q.topic_id=rand(1..150)
 q.user_id=rand(1..150)
 q.save
end

700.times do |i|
 t=QuestionHasTag.new
 t.question_id=rand(1..500)
 t.tag_id=rand(1..120)
 t.save
end

300.times do |i|
 t=Postulate.new
 t.question_id=rand(1..500)
 t.user_id=rand(1..150)
 t.save
end

200.times do |i|
 at=QuestionAttachment.new
 at.question_id=rand(1..500)
 at.save
end

300.times do |i|
	dr=DomainRank.new
	dr.user_id=rand(1..150)
	dr.topic_id=rand(1..150)
	dr.level=rand(0..5741)
	dr.save
end
