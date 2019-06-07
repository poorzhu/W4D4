class ApplicationController < ActionController::Base

    helper_method :logged_in?

    def current_user # sessions_controller#destroy, html
        return nil unless session[:session_token] # where does :session_token come from?
        @current_user ||= User.find_by(session_token: session[:session_token]) # why instance variable?
    end

    def logged_in? # application view
        !!current_user # forces returned boolean
    end

    def log_in_user!(user) # sessions_controller#create, users_controller#activate
        session[:session_token] = user.reset_session_token! # why reset?
    end


end
