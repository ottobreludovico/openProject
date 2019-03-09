class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to home_url
    else
      # Create an error message.
      redirect_to login_url, alert: 'Invalid email/password combination'
    end
  end

  def delete
    log_out
    redirect_to root_url
  end
end
