class Admin::UsersController  < Admin::ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order("name ASC")
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'Utilisateur créé.'
    else
      render action: 'new'
    end

  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Utilisateur modifié.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :group_id, :email, :phone)
    end
end
