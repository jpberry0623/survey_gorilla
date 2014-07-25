require 'faker'

#accesslevel
["public", "private"].each do |access|
	AccessLevel.create(name: access)	
end

#question_type 
[ "radio", "check_box", "dropdown"].each do |question|
	QuestionType.create(name: question)
end	

#region
["north","south","east", "west"].each do |region|
	Region.create(name: region)
end	
 
#User
20.times do 
	Taker.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, birthday: Date.now, region_id: rand(4))

# Survey
5.times do 
	Survey.create(name: Faker::Name.title, user_id: rand(10), access_level_id: rand(10))
end

#Question
20.times do 
	Question.create(question_type_id: rand(3), survey_id: rand(5), prompt: Faker::Lorem.sentence)
)
end

#choices
30.times do
	Choices.create(question_id: rand(20), label: Faker::Name.title) 
end

#result
30.times do 
	Result.create(user_id: rand(20), choice_id: rand(30))
end

