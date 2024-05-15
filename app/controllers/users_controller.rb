class UsersController < ApplicationController

  def show
    load_user
  end

  def index
    load_users
  end

  def new
    @user = user_scope.build
  end

  def create
    build_user
    if up.validate?
      render 'new'
    elsif @user.save
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    load_user
  end

  def update
    load_user
    build_user
    if up.validate?
      render 'edit'
    elsif @user.save
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    load_user
    @user.destroy!
    redirect_to :users
  end

  private

  def load_user
    @user ||= user_scope.find(params[:id])
  end

  def build_user
    @user ||= user_scope.build
    @user.attributes = user_params
  end

  def user_params
    params.require(:user).permit(
      :name,
      :role,
      :newsletter,
    )
  end

  def user_scope
    User.all
  end

  def load_users
    @users ||= user_scope.strict_loading.to_a
  end

end
