get '/users/:id' do
  @user = User.find(params[:id])
  @surveys = Survey.where(user_id: params[:id])
  @results = Result.where(user_id: params[:id])
  erb :'current_user/profile'
end


