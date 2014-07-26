get '/' do

	@surveys = Survey.all
	erb :homepage
end


get '/users/:id' do
	@user = User.find(params[:id])
	erb :"current_user/profile"
end

post '/users/create' do
	p params[:new_user]
	# @user = User.create(params[:new_user])
	redirect "/"
end

get '/login_signup' do

	erb :"/current_user/login_signup"
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



# get 'users/:id/edit' do


# end



