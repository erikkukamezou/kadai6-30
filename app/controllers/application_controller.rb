class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  # ロケール振り分けを全てのアクションで実行
  around_action :switch_locale

  # params値のロケールによる振り分け
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # url_for関係メソッドでロケールを設定するよう上書き
  def default_url_options
    { locale: I18n.locale }
  end


  # before_action :redirect_tasks, only: [:new]
  # before_action :current_user, onlhy: [:new]
  # before_action :ensure_current_user, only:[:show, :edit, :update]

  # def set_current_user
  #   @current_user=User.find_by(id :session[:user_id])
  # end
  #
  # def set_current_user
  #   current_user=User.find_by(id :session[:user_id])
  #   unless current_user?
  #     redirect_to tasks_path, notice: "あなたはではありません"
  #   end
  # end

  private
  def login_required
    redirect_to new_session_path unless current_user
  end
  # def current_user
  #   unless current_user?
  #     redirect_to tasks_path, notice: "あなたは管理者ではありません"
  #   end
  # end
  # def redirect_tasks
  #   redirect_to root_path if current_user
  # end

  # def ensure_current_user
  #     if @current_user.id != params[:id].to_i
  #       redirect_to root_path
  #     end
  # end



  # def  current_user
  #   # @current_user=User.find_by(id :session[:user_id])
  #   if @current_user == nil
  #     redirect_to tasks_path, notice: "あなたはではありません"
  #   end
  # end
  # def redirect_tasks
  #   # if @current_user == nil
  #     redirect_to tasks_path, notice: "あなたはではありません"
  #   # end
  # end
  # def current_user
  #   unless current_user?
  #     redirect_to tasks_path, notice: "あなたは管理者ではありません"
  #   end
  # end
  # def current_user
  #   # user = User.find_by(email: params[:session][:email].downcase)
  #   # user && user.authenticate(params[:session][:password])
  #   session[:user_id] = user.id
  #  unless session[:user_id] = user.id?
  #   redirect_to tasks_path, notice: "あなたはではありません"
  #   end
  # end
  # def redirect_tasks
  #   redirect_to tasks_path if current_user
  # end
  # def set_current_user
  #   if @current_user == nil
  #     redirect_to tasks_path, notice: "あなたはではありません"
  #   end
  # end

end
