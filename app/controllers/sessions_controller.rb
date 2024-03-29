class SessionsController < ApplicationController
   
   def new
     @user = User.new
   end
    
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in succesfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to login_path, :notice => "Logged out succesfully"
  end
  
end
