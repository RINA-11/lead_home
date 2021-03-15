class PostsController < ApplicationController
  
  before_action :master_all, only: [ :new, :create ]
  
  def new
    @post = Post.new
    @post_image = @post.images.build
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
    @posts = Post.includes(:images).all.page(params[:page]).per(5)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @message = Message.new
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    
  end
  
  def destroy
    
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
                                   images_attributes: [:id,
                                                       :post_id,
                                                       :post_image1,
                                                       :post_image2,
                                                       :post_image3,
                                                       :post_image4,
                                                       :post_image5])
    end
  
end