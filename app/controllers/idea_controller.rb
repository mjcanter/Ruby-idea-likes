class IdeaController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @ideas = Idea.all.includes(:user, :likes).order(:likes_count).reverse_order
    @likes = Like.all
  end

  def show
  	@idea = Idea.find(params[:id])
  	@ideas = Idea.includes(:user, :likes)
    @users = User.all
    @likes = Like.where(idea_id: params[:id])    
  end

  def delete
  	Idea.find(params[:id]).destroy
  	redirect_to '/ideas'
  end

  def create
  	@secret = Idea.create(idea_params)
  	redirect_to '/ideas'
  end

  private
  
  def idea_params
  	params.require(:ideas).permit(:id, :content, :user_id)
  end
  def likes_params
  	params.require(:likes).permit(:id, :user_id, :idea_id)
  end

end


