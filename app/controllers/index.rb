get '/' do
	@user ||= session[:user_id]
	@surveys = Survey.all
	erb :homepage
end


post '/users/new' do
	p params
	p @user = User.create(params[:new_user])
	session[:user_id] = @user.id
end


get '/users/:id' do
	# @user = User.find(params[:id])
	#erb to be decided
end

post '/users' do
	@user = User.create(params[:new_user])
	redirect "/users/#{@user.id}"
end

get '/users/new' do
	@regions = Region.all
	erb :'users/new'
end


get '/users/login' do
	erb :'users/login'
end

post '/users/login' do
	@user = User.find_by_username(params[:username])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/"
	else
		redirect "/users/login"
	end
end


get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id' do
	# @user = User.find(params[:id])
	#erb to be decided
end


get 'users/:id/edit' do

end





