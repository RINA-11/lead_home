class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to post_path(id: params[:message][:post_id]), success: "メッセージを投稿しました"
    else
      flash.now[:danger] = "メッセージの投稿に失敗しました"
      @message = Message.new
      render template: "posts/show"
    end
  end
  
  def destroy
    @message = Message.find_by(user_id:current_user.id, post_id: params[:post_id])
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
