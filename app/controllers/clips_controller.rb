class ClipsController < ApplicationController
  
  def index
    @clip_posts = current_user.clip_posts
  end
  
  def create
    @clip = Clip.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to post_path
  end
  
  def destroy
    @clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    @clip.destroy
    redirect_to post_path
  end
  
end
