class Admin::UserPolicy
    attr_reader :context, :user, :session_profiles

    def initialize(context, record)
        @context = context
        @record = record
    end

    delegate :user, to: :context
    delegate :session_profiles, to: :context
    
    def index?
        JSON.parse(session[:profiles]).include? :admin
    end
end
