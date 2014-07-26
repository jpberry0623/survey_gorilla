# CREATE NEW SURVEY

get '/surveys/new' do
	erb :"surveys/new"
end

post '/surveys/create' do
	@survey = Survey.create(name: params[:name])
	redirect "/surveys/#{@survey.id}"
end

# EDIT A SURVEY
# (its title and any other survey (not question/results) characteristics)
# not needed for MVP
get 'surveys/:id/edit' do
end

patch '/surveys/:id' do
end

# DELETE SURVEY

get '/surveys/:id/delete' do
end

delete '/surveys/:id/delete' do
	redirect to ('/')
end



# VIEW LIST OF SURVEYS

get '/surveys/all' do
	erb :"surveys/all_surveys"
end

# VIEW INDIVIDUAL SURVEY (without results)

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :"surveys/show"
end


# WE SHOULD MOVE BELOW ROUTES TO SEPARATE FILES:  questions.rb
#																							  	results.rb

# CREATE NEW SURVEY QUESTION

get '/surveys/:id/questions/new' do
	@survey = Survey.find(params[:id])
	erb :"surveys/questions/new"
end

post "/surveys/:id/questions/create" do
	@survey = Survey.find(params[:id])
	@question = Question.create(prompt: params[:prompt], survey_id: @survey.id)
	@question.to_json
	# redirect "surveys/#{@survey.id}"
end

# EDIT SURVEY QUESTION

get "/surveys/:id/questions/:id/edit" do
	@survey = nil
end
# get 'surveys/:id/edit' do
# 	@survey = Survey.find(params[:id])
# end

# TAKE A SURVEY
get '/surveys/:id/take' do
	@survey = Survey.find(params[:id])
	erb :"surveys/survey_take"
end


