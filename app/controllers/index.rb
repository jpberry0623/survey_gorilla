get '/' do
	@user ||= session[:user_id]
	@surveys = Survey.all
	erb :homepage
end
