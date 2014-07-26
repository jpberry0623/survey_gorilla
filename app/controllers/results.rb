# DISPLAY RESULTS OF THE ENTIRE SURVEY
get '/surveys/:id/results' do
	@survey = Survey.find(params[:id])
  @results_hash = Result.group(:choice_id).count
	 erb :"/result/result_survey"
end

