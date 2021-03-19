class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
  def master_all
    @purposes = Purpose.all
    @prefectures = Prefecture.all
    @cities = City.all
    @pet_categories = PetCategory.all
    @pet_sexes = PetSex.all
  end
  
  def post_master
    @post = Post.find_by(id: params[:id])
    @purpose = Purpose.find_by(id: @post.purpose_id)
    @prefecture = Prefecture.find_by(id: @post.prefecture_id)
    @city = City.find_by(id: @post.city_id)
    @pet_category = PetCategory.find_by(id: @post.pet_category_id)
    @pet_sex = PetSex.find_by(id: @post.pet_sex_id)
  end
  
end
