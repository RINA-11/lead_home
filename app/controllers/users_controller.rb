class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_top_path, success: "登録が完了しました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: current_user.id)
    @posts = Post.includes(:images).where(user_id: current_user.id).page(params[:page]).per(20)
  end
  
  def edit
    @user = User.find_by(id: current_user.id)
  end
  
  def update
    @user = User.find_by(id: current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.id), success: "ユーザー情報を更新しました"
    else
      flash.now[:danger] = "ユーザー情報の更新に失敗しました"
      render :show
    end
  end
  
  def destroy
    @user = User.find_by(id: current_user.id)
    if @user.destroy
      redirect_to home_top_path, success: "ユーザーを削除しました"
    else
      flash.now[:danger] = "ユーザーの削除に失敗しました"
      render :show
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:id,
                                   :name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end

end