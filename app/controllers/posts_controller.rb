class PostsController < ApplicationController
  
  before_action :master_all, only: [ :new, :create ]
  
  def new
    @post = Post.new
    #2.times do
    @post_image = @post.images.build
    #end
  end
  
  def create
    @post = Post.new(post_params)
    #binding.pry
    if @post.save
      #if params[:images].present?
        #params[:images][:post_image].each do |a|
          #@post_image = @post.images.create(post_id: @post.id, post_image: a)
        #end
      #end
      redirect_to posts_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def index
    @posts = Post.all.page(params[:page]).per(20)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @message = Message.new
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
                                   images_attributes: [:id, :post_id, { post_image: [] } ])
    end
  
end