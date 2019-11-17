class LoginController < ApplicationController
  layout false
  def index
    if current_user.present?
      redirect_to root_path
    end
  end
end
