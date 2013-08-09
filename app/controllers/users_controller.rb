class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(params[:user])
    user.status = "deactivated"
    user.admin = "false"
    if user.save
      flash[:message] = "Check your email, now!"
      redirect_to new_session_url
    else
      flash[:message] = "That password or email has been taken."
      redirect_to new_user_url
    end
  end
end
