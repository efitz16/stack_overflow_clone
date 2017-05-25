class SessionsController < ApplicationController
  def new
  	redirect_to current_user if helpers.logged_in?
  end

  def create
  	user = User.find_by(email: session_params[:email].downcase)

    if user
      helpers.log_in(user.id)
      redirect_to(user)
    else
      # @errors = "The username/password combination was not found"
      flash[:notice] = "The username/password combination was not found"
      render 'new'
    end

  end

  def delete
    helpers.log_out if helpers.logged_in?
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
