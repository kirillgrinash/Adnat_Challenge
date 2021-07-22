class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
