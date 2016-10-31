class UsersController < ApplicationController
  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    flash[:notice] = 'Your account and all characters have been deleted'
    redirect_to root_path
  end
end
