class UserController < ApplicationController
  	before_action :check_session
  def index
    @user = User.find_by_id(session[:user_id])
    @ideas = Idea.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
  end
  def delete
  	User.find(params[:id]).destroy
  	redirect_to '/users'
  end
  def edit
  	user = User.update(user_params)

  	if User.valid?
  		redirect_to '/users'
  	else
  		redirect_to '/edit'
  		flash[:error] = @message.errors
    end
  end
  private
  def check_session
  	if !session[:user_id]
  		redirect_to '/'
    end
  end
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
