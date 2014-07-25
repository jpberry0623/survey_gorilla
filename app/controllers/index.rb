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

post '/login' do
	@user = User.find_by_username(params[:username])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/"
	else
		redirect "/login_signup"
	end
end


post '/logout' do

	session[:user_id] = nil
	redirect '/'
end



get 'users/:id/edit' do


end



