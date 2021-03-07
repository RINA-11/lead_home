class PostsController < ApplicationController
  
  before_action :master_all, only: [ :new, :create ]
  
  def new
    @post=Post.new
    @image=@post.images.build
  end
  
  def create
    @post=Post.new(post_params)
    if @post.save
      Image.create(post_id: @post.id, post_image: params[:post_image])
      #params[:post_image].each do |a|
        #@post.images.create(post_id: @post.id, post_image: a)
      #end
      redirect_to posts_path(current_user.id), success: "投稿に成功しました"
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
      params.require(:post).permit(:user_id,
                                   :purpose_id,
                                   :pet_category_id,
                                   :prefecture_id,
                                   :city_id,
                                   :pet_sex_id,
                                   :pet_breed,
                                   :address_line,
                                   :happened_at,
                                   :content)
    end
  
end