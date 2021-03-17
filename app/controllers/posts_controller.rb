class PostsController < ApplicationController
  
  before_action :master_all, only: [ :new, :create, :edit ]
  
  def new
    @post = Post.new
    @post_image = @post.build_image
  end
  
  def create
    @post = Post.new(post_params)
    #binding.pry
    if @post.save
      redirect_to posts_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def index
    @posts = Post.includes(:image).all.page(params[:page]).per(5)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @message = Message.new
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @post_image = @post.build_image
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_path(id: params[:id]), success: "投稿を更新しました"
    else
      flash.now[:danger] = "投稿の更新に失敗しました"
      render :show
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      redirect_to posts_path, success: "投稿を削除しました"
    else
      flash.now[:danger] = "投稿の削除に失敗しました"
      render :show
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:user_id,
                                   :purpose_id,
                                   :pet_category_id,
                                   :prefecture_id,
                                   :city_id,
                                   :pet_sex_id,
                                   :pet_breed,
                                   :address_line,
                                   :happened_at,
                                   :content,
                                   :video,
                                   :video_cache,
                                   image_attributes: [:id,
                                                      :post_id,
                                                      :post_image1,
                                                      :post_image2,
                                                      :post_image3,
                                                      :post_image4,
                                                      :post_image5,
                                                      :post_image1_cache,
                                                      :post_image2_cache,
                                                      :post_image3_cache,
                                                      :post_image4_cache,
                                                      :post_image5_cache,
                                                      :_destroy])
    end
  
end