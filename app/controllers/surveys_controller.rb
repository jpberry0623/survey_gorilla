get '/surveys/new' do 

	erb :"surveys/new"
end 

post '/surveys/create' do 
	@survey = Survey.create(name: params[:name])

	redirect "/surveys/#{@survey.id}"
end

get '/surveys/:id' do 
	@survey = Survey.find(params[:id])	
	erb :"surveys/show"

end