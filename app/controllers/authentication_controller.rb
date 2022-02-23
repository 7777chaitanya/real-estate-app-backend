class AuthenticationController < ApplicationController
  def index
  end

  def validate
    @username = params[:username]
    @password = params[:password]
    isPresent = User.find_or_create_by(username: "USERNAME")
    if isPresent[:username] == @username 
      render :json => {:available => true}
    else
      render :json => {:available => false}
    end
  end
end
