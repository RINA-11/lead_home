class PostsController < ApplicationController
  
  def new
    @post=Post.new
    @purposes=Purpose.all
    @pet_categories=PetCategory.all
    @pet_sexes=PetSex.all
    @cities=City.all
  end
  
  def create
    
  end
  
  def index
  end
  
  private
  
    def post_params
      params.require(:post).permit(#:user_id,
                                   :purpose_id,
                                   :pet_category_id,
                                   :city_id,
                                   :pet_sex_id,
                                   :pet_breed,
                                   :address_line,
                                   :happened_at,
                                   :content)
    end
  
end