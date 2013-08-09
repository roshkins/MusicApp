class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.password == params[:user][:password]
      && user.status
      session[:token] = user.secure_session_token
      redirect_to bands_url
    end
  end

  def new
    render :new
  end

  def destroy
    session[:token] = nil
    current_user.session_token = nil
    current_user.save!
    redirect_to new_session_url
  end
end
