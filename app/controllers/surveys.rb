# NEW SURVEY
get '/surveys/new' do
  erb :"surveys/new"
end

post '/surveys/create' do
  @survey = Survey.create(name: params[:name])
  redirect "/surveys/#{@survey.id}"
end

# EDIT SURVEY
get 'surveys/:id/edit' do
end

patch '/surveys/:id' do
end

# DELETE SURVEY
get '/surveys/:id/delete' do
  @survey = Survey.find(params[:id])
  @survey.delete
  redirect to ('/')
end

# VIEW LIST OF ALL SURVEYS
get '/surveys/all' do
  erb :"surveys/all_surveys"
end

# VIEW INDIVIDUAL SURVEY
get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end