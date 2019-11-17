class AdminController < ApplicationController
    before_action :authenticate_user

    def index
    end

    private
    def authenticate_user
        if current_user.nil? || current_user.role != "admin"
            redirect_to login_index_path
            return
        end
    end
end