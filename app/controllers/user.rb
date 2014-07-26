# CREATE NEW USER

get '/users/new' do
	@regions = Region.all
	erb :'users/new'
end


post '/users/new' do
	@user = User.create(params[:new_user])
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}"
end


# USER PROFILE
get '/users/:id' do
	@user = User.find(params[:id])
	# @surveys_taken = @user.surveys
	@surveys = Survey.all
	erb :"users/profile"
end

# EDIT USER PROFILE

get '/users/:id/edit' do
	erb :"users/profile_edit"
	# ALAN TO DO 
	# NOTE TO SELF, ALAN (user the :update_user hash to hold changed data)
end

patch '/users/:id' do
	@user = User.find(params[:id])
	@user.update(params[:update_user])
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




# USER LOGIN STUFF

get '/users/login' do
	erb :'users/login'
end


# CREATE NEW USER

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

