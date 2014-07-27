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
get "/surveys/:survey_id/questions/:id/edit" do
	@survey = Survey.find(params[:survey_id])
	@question = Question.find(params[:id])
	puts @survey
	puts @question
	10.times {puts "X\n"}
	erb :'surveys/questions/edit'
end

patch "/surveys/:survey_id/questions/:id" do
	
end

# DELETE SURVEY QUESTION
# Not needed for mvp
get '/surveys/:survey_id/:id/delete' do
	@question = Question.find(params[:id])

end

delete '/surveys/:survey_id/:id' do  

end
