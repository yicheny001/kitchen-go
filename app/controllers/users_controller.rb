class UsersController < ApplicationController
  
  def new
    if current_user
      redirect_to root_url
    else 
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    @user.reader = Reader.create(user_id: @user.id)
    @user.shopping_list = ShoppingList.create(user_id: @user.id)
    session[:user_id] = @user.id
    redirect_to recipes_path
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to '/profile'
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(params[:user].keys)
  end

end
