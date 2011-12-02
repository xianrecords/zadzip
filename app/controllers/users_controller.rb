class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      user = User.authenticate(@user.email, @user.password)
      session[:user_id] = user.id
      redirect_to root_path, :notice => "New User Created succesfully"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:users])
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
end
