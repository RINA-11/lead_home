class MessagesController < ApplicationController
  
  before_action :authenticate_user, only: [:create, :destroy]
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to post_path(id: params[:message][:post_id]), success: "メッセージを投稿しました"
    else
      flash.now[:danger] = "メッセージの投稿に失敗しました"
      @post = Post.find_by(id: params[:message][:post_id])
      render template: "posts/show"
    end
  end
  
  def destroy
    @message = Message.find_by(id: params[:id])
    if @message.destroy
      flash[:info] = "メッセージを削除しました"
      redirect_back(fallback_location: post_path)
      #redirect_to post_path(id: params[:id]), info: "メッセージを削除しました"
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
