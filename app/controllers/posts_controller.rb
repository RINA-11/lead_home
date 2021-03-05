class PostsController < ApplicationController
  
  def new
    @post=Post.new
    @post_image=@post.images.build
    @purposes=Purpose.all
    @pet_categories=PetCategory.all
    @pet_sexes=PetSex.all
    @prefectures=Prefecture.all
    @cities=City.all
  end
  
  def create
    @post=current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
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
                                   image_attributes: [:post_image]
                                   )
    end
  
end