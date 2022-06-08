class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params["user"]["username"].empty? ||  params["user"]["email"].empty? ||  params["user"]["password"].empty?
      flash["notice"] = "Please enter values for all fields."
      redirect_to "/users/new"
    else
      @user = User.new
      @user["username"] = params["user"]["username"]
      @user["email"] = params["user"]["email"]
      @user["password"] = BCrypt::Password.create(params["user"]["password"])
      @user.save
      session["user_id"] = @user["id"]
      redirect_to "/places"
    end
  end
end
