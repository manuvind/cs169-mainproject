class UsersController < ApplicationController
  before_filter :is_admin

  def is_admin
    if !current_user.is_admin?
      redirect_to events_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to user_index_path
    else
      render :action => 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to user_index_path
  end

  def index
    @users = User.all
  end

  def show
  end
end
