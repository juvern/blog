class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to new_post_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	session.delete(:user_id)
  	@current_user = nil
  	redirect_to root_url
  end
end
