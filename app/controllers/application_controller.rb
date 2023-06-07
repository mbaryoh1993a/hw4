class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = User.find_by({ "id" => session["user_id"] })
    @current_username = User.find_by({ "username" => session["username"] })
  end
end
