class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    skip_before_action :authorize
    def create
        user = User.where(username: params[:user][:username]).first
        if user.nil? or not user.authenticate(params[:user][:password])
            redirect_to login_index_path
            return
        end
        session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_path
	end
end
