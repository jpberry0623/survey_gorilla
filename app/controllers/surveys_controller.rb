get '/surveys/new' do
	erb :"surveys/new"
end

post '/surveys/create' do
	@survey = Survey.create(name: params[:name])

	redirect "/surveys/#{@survey.id}"
end

get '/surveys/all' do
	erb :"surveys/all_surveys"
end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :"surveys/show"
end

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

get "/surveys/:id/questions/:id/edit" do

	@survey = nil

end
# get 'surveys/:id/edit' do
# 	@survey = Survey.find(params[:id])
# end
