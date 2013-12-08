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
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      flash[:success] = 'User was successfully updated.'
      redirect_to user_index_path
    else
      flash[:error] = 'Uh-oh. Something went wrong. Please try again.'
      render action: 'edit'
    end
  end

  def edit
    @user = User.find params[:id]
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