helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

  require 'digest/md5'

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

end
