# CREATE NEW SURVEY QUESTION CHOICE


get '/surveys/:survey_id/questions/:question_id/choices/new' do

end


post '/surveys/:survey_id/questions/:question_id/choices/create' do

end



# EDIT SURVEY QUESTION CHOICE
# maybe not needed for mvp

get '/surveys/:survey_id/questions/:question_id/choices/:id/edit' do

end

patch '/surveys/:survey_id/questions/:question_id/choices/:id' do
	
end


# DELETE SURVEY QUESTION CHOICE
# not needed for mvp

get '/surveys/:survey_id/questions/:question_id/choices/:id/delete' do

end

delete '/surveys/:survey_id/questions/:question_id/choices/:id' do

end

