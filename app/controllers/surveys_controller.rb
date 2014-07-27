# NEW SURVEY
get '/surveys/new' do
	erb :"surveys/new"
end

post '/surveys/create' do
	@survey = Survey.create(name: params[:name])
	redirect "/surveys/#{@survey.id}"
end

# EDIT SURVEY
# Should be able to change survey's title
# and any other survey (non question/results) characteristics
# Not needed for MVP
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



# VIEW LIST OF ALL SURVEYS
get '/surveys/all' do
	erb :"surveys/all_surveys"
end

# VIEW INDIVIDUAL SURVEY (without results)
get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :"surveys/show"
end

# TAKE A SURVEY
get '/surveys/:id/take' do
	@survey = Survey.find(params[:id])
	erb :"surveys/survey_take"
end

post '/surveys/:id/take' do
	p "++++++++++++++++++++++++++++++++"
	p session[:user_id]
	p question = params[:question]
	question.each_pair do |key, value|
		Result.create(user_id: session[:user_id], choice_id: value.to_i)
	end
  redirect('/')
end


