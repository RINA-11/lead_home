class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user=User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path
    else
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to home_top_path
  end
  
  private
  
    def log_in(user)
     session[:user_id]=user_id
    end
    
    def log_out
      session.delete(:user_id)
      @current_user=nil
    end
  
end
