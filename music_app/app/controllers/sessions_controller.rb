class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            # flash
            redirect_to new_user_url
        else
            log_in_user!(user)
            render user_url(user[:id])
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url # difference between :new and new_session_url?
    end
end
