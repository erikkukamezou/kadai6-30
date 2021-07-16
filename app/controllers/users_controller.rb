class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  # before_action :redirect_tasks, only: [:new]
  # before_action :not_current_user, only: [:show]
  # before_action :current_user, {only: [:new]}
  before_action :set_user,  only: [:show]
  # before_action :set_current_user, only: [:show]
  # @current_user=User.find_by(id: session[:user_id])
  # end
  # before_action :current_user,   only: [:show]
  # before_action :new_create, only: [:new]
  # before_action :forbid_login_user, only: [:new]
  before_action :login_user, only: [:new]



  # def show
  #   @tasks = @user.tasks
  # end

  def new
    @user =User.new
    # if unless @user == current_user
    #   redirect_to tasks_path, notice: "登録は一回だけだよ"
    # else
    #   render :new　
    # end
    # #
  end
  def create
    @user =User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      # flash[:notice] = "アカウント作成後、ログインしました。"
      # @tasks = current_user.tasks
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end
  def show
    # @user =User.find(params[:id])
    # if @user == current_user
    #   redirect_to tasks_path
    # else
    #   redirect_to root_path, notice: "あなたではありません"
    # end

    @user =User.find(params[:id])
    if @user == current_user
      render "show"
    else
      redirect_to tasks_path, notice: "あなたではありません"
    end
    # if @user == @user.
    #   redirect_to tasks_path
    # else
    #   redirect_to root_path, notice: "あなたではありません"
    # end

  end


  # def forbid_login_user
  #   #ログイン状態だったら
  #   @user =User.find(params[:id])
  #   if @user == current_user
  #     flash[:notice] = "すでにアカウントがあるよ！"
  #     redirect_to tasks_path
  #   end
  # end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  # def not_current_user
  #   redirect_to tasks_path, unless current_user&.id == @user&.id
  # end
  # end
  def set_user
    @user = User.find(params[:id])
  end

  # def new_create
  #   if @user == current_user
  #     redirect_to tasks_path, notice: "登録は一回だけだよ"
  #   # elsefq
  #   #   render :new　
  #   end
  #   #
  # end

  # def set_current_user
  #   unless user_logged_in? = current_user.name
  #     redirect_to tasks_path
  #   end
  # end
  # def current_user
  #       user = User.find(params[:id])
  #     unless @task.user == current_user
  #       redirect_to tasks_path
  #     end
  # end

  # def forbid_login_user
  #   #ログイン状態だったら
  #   if @current_user
  #     flash[:notice] = "すでにアカウントがあるよ！"
  #     redirect_to tasks_path
  #   end
  # end
  def login_user
    if @user == current_user
      render :new
    else
      redirect_to tasks_path
    end
  end
end
