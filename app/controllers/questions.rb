# CREATE NEW SURVEY QUESTION

# this route commented out until moved from surveys_controller.rb
#get '/surveys/:survey_id/questions/new' do
#end

# Commented out until moved from surveys_controller.rb
#post "/surveys/:survey_id/questions/create" do

#end



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
# not needed for mvp

get '/surveys/:survey_id/:id/delete' do
	@question = Question.find(params[:id])

end

delete '/surveys/:survey_id/:id' do  

end

