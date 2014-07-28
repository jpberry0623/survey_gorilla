# CREATE NEW USER

get '/users/new' do
	@regions = Region.all
	erb :'users/new'
end


post '/users/create' do
	@user = User.create(params[:new_user])
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}"
end

# USER LOGIN STUFF

get '/users/login' do
	@errors =
	erb :'users/login'
end


post '/users/login' do
	@user = User.find_by_email(params[:email])
	p params[:email].inspect
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		session[:errors] = 'derp'
		redirect "/users/login"
	end
end

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end


# USER PROFILE
get '/users/:id' do
	@user = User.find(params[:id])

	@surveys_written = Survey.where(user_id: @user.id)
	@surveys_taken = @user.taken_surveys(@user.id)
	#@surveys = Survey.all
	erb :"users/profile"
end

# EDIT USER PROFILE

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"users/profile_edit"
	# ALAN TO DO
	# NOTE TO SELF, ALAN (user the :update_user hash to hold changed data)
end

patch '/users/:id' do
	@user = User.find(params[:id])
	@user.update(params[:user])
	redirect to ("/users/#{@user.id}")
end


# DELETE USER

get '/users/:id/delete' do
	@user = User.find(params[:id])
	erb :"users/delete_profile_warning"
end

delete '/users/:id/delete' do
	# BUG:  Not Currently Working
	# Alan to Fix
		# Go thru all of the surveys that this author created
		# Change all of those surveys' author_id to nil
	User.find(params[:id]).destroy
	session.clear
	session[:user_id] = nil
	redirect to ('/')
end




