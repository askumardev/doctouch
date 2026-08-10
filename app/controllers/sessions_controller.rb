class SessionsController < ApplicationController
  layout "application"

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password]) && user.super_admin?
      session[:user_id] = user.id
      redirect_to super_admin_root_path, notice: "Signed in successfully."
    else
      flash.now[:alert] = "Invalid email/password or not authorized."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Signed out successfully."
  end
end
