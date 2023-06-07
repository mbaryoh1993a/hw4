class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      password_the_user_typed = params["password"]
      password_in_the_database = @user["password"]
      if BCrypt::Password.new(password_in_the_database) == password_the_user_typed
        flash["notice"] = "Yes!"
        session["user_id"] = @user["id"]
        session["username"] = @user[""]username
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "/sessions/new"
      end
    else
    flash["notice"] = "Nope."
    redirect_to "/sessions/new"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    session["username"] = nil
    redirect_to "/sessions/new"
  end
end
  