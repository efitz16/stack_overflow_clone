class UsersController < ApplicationController
  # before_action: :
  def new
  	if helpers.logged_in?
  	  redirect_to root_url
  	else
  	  @user = User.new
    end
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  	  helpers.log_in(@user.id)
  	  redirect_to(@user)
  	else
  	  @errors = @user.errors
  	  render 'new'
  	end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end
end
