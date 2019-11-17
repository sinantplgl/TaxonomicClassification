class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
    private

    def current_user
        @current_user ||= User.find(session["user_id"]) if session[:user_id]
    end

    def authorize
        if not (current_user.present? && current_user.role == "admin")
            redirect_to root_path
            return
        end
    end

    helper_method :current_user
end
