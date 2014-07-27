# DISPLAY RESULTS
get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  @results_hash = Result.group(:choice_id).count
  erb :"/result/result_survey"
end

# TAKE SURVEY
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