get '/' do
	@user ||= session[:user_id]
	@surveys = Survey.all
	@regions = Region.all
	erb :homepage
end
