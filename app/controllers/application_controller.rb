class ApplicationController < ActionController::Base
	include Pundit::Authorization
	
	before_action :authenticate_user!

	def pundit_user
		UserContext.new(current_user, session_profiles)
	end

	def session_profiles
		session[:profiles] ||= current_user.profiles.pluck(:name)
	end

	Profile.all.each do |profile|
			define_method "current_user_#{profile.name}?" do
				JSON.parse(session[:profiles]).include? profile.name
		end
	end
end
