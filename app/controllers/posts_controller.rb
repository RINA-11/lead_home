class PostsController < ApplicationController
  
  def new
    master_all
    @post=Post.new
    #@post.images.new
    @image=@post.images.build
  end
  
  def create
    master_all
    @post=current_user.posts.new(post_params)
    if @post.save
      params[:images]["post_image"].each do |a|
        @image=@post.images.create(post_image: a, post_id: @post.id)
      end
      redirect_to posts_path(@current_user.id), success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def index
    @posts=Post.all.order(created_at: "desc")
  end
  
  private
  
    def post_params
      params.require(:post).permit(:purpose_id,
                                   :pet_category_id,
                                   :prefecture_id,
                                   :city_id,
                                   :pet_sex_id,
                                   :pet_breed,
                                   :address_line,
                                   :happened_at,
                                   :content,
                                   images_attributes: [:id, :post_id, :post_image]
                                   )
    end
  
end