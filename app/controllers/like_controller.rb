class LikeController < ApplicationController
  def like
  	Like.create(likes_params)
    redirect_to '/ideas'
  end
  def unlike
    Like.find_by(likes_params).destroy
    redirect_to '/ideas'
  end

  private
  
  def likes_params
  	params.require(:likes).permit(:id, :idea_id, :user_id)
  end
  
end
