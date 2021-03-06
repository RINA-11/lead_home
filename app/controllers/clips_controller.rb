class ClipsController < ApplicationController
  
  before_action :master_all, only: [:index]
  before_action :authenticate_user, only: [:index, :create, :destroy]
  
  def index
    @clip_posts = current_user.clip_posts.order(created_at: "desc").page(params[:page]).per(24)
  end
  
  def create
    @clip = Clip.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to post_path(id: params[:post_id], anchor: "clip")
  end
  
  def destroy
    @clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    @clip.destroy
    redirect_to post_path(id: params[:post_id], anchor: "unclip")
  end
  
end
