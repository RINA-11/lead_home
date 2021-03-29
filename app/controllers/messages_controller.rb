class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to post_path(id: params[:message][:post_id]), success: "メッセージを投稿しました"
    else
      flash.now[:danger] = "メッセージの投稿に失敗しました"
      @post = Post.find_by(id: params[:message][:post_id])
      @purpose = Purpose.find_by(id: @post.purpose_id)
      @prefecture = Prefecture.find_by(id: @post.prefecture_id)
      @city = City.find_by(id: @post.city_id)
      @pet_category = PetCategory.find_by(id: @post.pet_category_id)
      @pet_sex = PetSex.find_by(id: @post.pet_sex_id)
      render template: "posts/show"
    end
  end
  
  def destroy
    @message = Message.find_by(user_id:current_user.id, post_id: params[:id])
    if @message.destroy
      redirect_to post_path(id: params[:post_id]), info: "メッセージを削除しました"
    else
      flash.now[:danger] = "メッセージの削除に失敗しました"
      render template: "posts/show"
    end
  end
  
  private
  
    def message_params
      params.require(:message).permit(:id, :user_id, :post_id, :content)
    end
  
end
