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
      redirect_to users_path
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
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
  end
end
