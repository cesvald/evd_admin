class UserContext
	attr_reader :user, :session
  
	def initialize(user, session_profiles)
	  @user = user
	  @session_profiles = session_profiles
	end
end
