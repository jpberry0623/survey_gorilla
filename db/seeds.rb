require 'faker'

# #accesslevel
# ["public", "private"].each do |access|
# 	AccessLevel.create(name: access)
# end

# #question_type
# [ "radio", "check_box", "dropdown"].each do |question|
# 	QuestionType.create(name: question)
# end

# #region
# ["north","south","east", "west"].each do |region|
# 	Region.create(name: region)
# end

# #User
# 20.times do
# 	User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, birthday: Faker::Business.credit_card_expiry_date, region_id: rand(4))
# end
# # Survey
# 5.times do
# 	Survey.create(name: Faker::Name.title, user_id: rand(10), access_level_id: rand(10))
# end

# #Question
# 20.times do
# 	Question.create(question_type_id: rand(3), survey_id: rand(5), prompt: Faker::Lorem.sentence)
# end

# #choices
# 30.times do
# 	Choice.create(question_id: rand(20), label: Faker::Name.title)
# end

#result
# 90.times do
# 	Result.create(user_id: rand(20), choice_id: rand(30))
# end

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
50.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, birthday: Faker::Business.credit_card_expiry_date, region_id: rand(4))
end
# Survey
5.times do
  Survey.create(name: Faker::Name.title, user_id: rand(10), access_level_id: rand(10))
end

#Question
20.times do
  Question.create(question_type_id: rand(3), survey_id: rand(5), prompt: Faker::Lorem.sentence)
end

#choices
30.times do
  Choice.create(question_id: rand(20), label: Faker::Name.title)
end

#result
30.times do
  Result.create(user_id: rand(20), choice_id: rand(30))
end


# Alans Special Survey Seeded Data
Survey.create(name: "Alan's Special Survey", user_id: 1, access_level_id:"public")
Question.create(question_type_id: 1, survey_id: 6, prompt: "Radio:  your favorite color")
Question.create(question_type_id: 1, survey_id: 6, prompt: "Radio:  the better band")
Question.create(question_type_id: 1, survey_id: 6, prompt: "Radio:  the better chain")
Question.create(question_type_id: 2, survey_id: 6, prompt: "check_box: soups you like")
Question.create(question_type_id: 2, survey_id: 6, prompt: "check_box: drinks you like")
Question.create(question_type_id: 2, survey_id: 6, prompt: "check_box: dogs you like")
Question.create(question_type_id: 3, survey_id: 6, prompt: "dropdown: best hood")
Question.create(question_type_id: 3, survey_id: 6, prompt: "dropdown: best car")
Question.create(question_type_id: 3, survey_id: 6, prompt: "dropdown: best cohort")


Choice.create(question_id: 21, label: "yellow")
Choice.create(question_id: 21, label: "blue")
Choice.create(question_id: 21, label: "green")
Choice.create(question_id: 21, label: "red")
Choice.create(question_id: 22, label: "rolling stones")
Choice.create(question_id: 22, label: "radiohead")
Choice.create(question_id: 22, label: "beatles")
Choice.create(question_id: 22, label: "spice girls")
Choice.create(question_id: 23, label: "chipotle")
Choice.create(question_id: 23, label: "tres carnes")
Choice.create(question_id: 23, label: "arbys")
Choice.create(question_id: 23, label: "burritoville")
Choice.create(question_id: 24, label: "chicken noodle")
Choice.create(question_id: 24, label: "mushroom barley")
Choice.create(question_id: 24, label: "tomato")
Choice.create(question_id: 24, label: "split pea")
Choice.create(question_id: 25, label: "scotch")
Choice.create(question_id: 25, label: "gin")
Choice.create(question_id: 25, label: "kool-aid")
Choice.create(question_id: 25, label: "coffee")
Choice.create(question_id: 26, label: "terriers")
Choice.create(question_id: 26, label: "boxers")
Choice.create(question_id: 26, label: "french bulldogs")
Choice.create(question_id: 26, label: "german shepherds")
Choice.create(question_id: 27, label: "bed stuy")
Choice.create(question_id: 27, label: "murray hill")
Choice.create(question_id: 27, label: "flushing")
Choice.create(question_id: 27, label: "west village")
Choice.create(question_id: 28, label: "toyota")
Choice.create(question_id: 28, label: "mercedes")
Choice.create(question_id: 28, label: "ford mustang")
Choice.create(question_id: 28, label: "bmw")
Choice.create(question_id: 29, label: "peepers")
Choice.create(question_id: 29, label: "woolies")
Choice.create(question_id: 29, label: "newts")
Choice.create(question_id: 29, label: "cicadas")



# Radio Buttons
# Q21
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(31..34))
  end

# Q22
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(35..38))
  end

# Q23
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(39..42))
  end

# Q27
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(55..58))
  end

# Q28
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(59..62))
  end

# Q29
  50.times do |user_num|
    Result.create(user_id: user_num+1, choice_id: rand(63..66))
  end

