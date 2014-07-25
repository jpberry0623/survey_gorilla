get '/' do	

	@surveys = Survey.all
	erb :homepage
end

get '/users/:id' do 

	# @user = User.find(params[:id])
	#erb to be decided
end

post '/users' do
	@user = User.create(params[:new_user])

	redirect "/users/#{@user.id}"
end

get '/users/create' do

	erb :new_user_create
end

get '/login_signup' do

	erb :login_signup
end



