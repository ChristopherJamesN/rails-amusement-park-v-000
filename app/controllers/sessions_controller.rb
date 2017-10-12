class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params.require(:user)[:name])
    return head(:forbidden) unless @user.authenticate(params.require(:user)[:password])
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    if session[:user_id] != nil
      session.delete :user_id
    end
    redirect_to 'login'
  end

end
