class UsersController < ApplicationController
  def index
  end

  def create
    puts params 
    
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    puts @user
    @user.save
    # @user = User.new(user_params)
    # if @user.save
    render :json => {:username => @user.username, :password => "hello"}
  end

  # private
  #   def user_params
  #     params.require(:user).permit(:username, :email, :password)
  #   end
end
