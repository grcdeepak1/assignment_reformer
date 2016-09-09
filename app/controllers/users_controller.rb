class UsersController < ApplicationController
  def new

  end

  def create
    binding.pry
    @user = User.create(whitelisted_user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private
  def whitelisted_user_params
    if params["user"] != nil
      params.require(:user).permit(:username, :email, :password)
    else
      { "email" => params["email"],
        "username" => params["username"],
        "password" => params["password"] }
    end
  end
end
