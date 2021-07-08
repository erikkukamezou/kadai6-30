class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
    if params[:sort_limit]
      @tasks = @tasks.order(:limit)
    else
      @tasks = @tasks.order(:created_at)
    end
  end

    # if params[:sort_expired]
    #   @tasks = Task.all.order(deadline: :desc)
    # end
    #
    # special_task_ids = Task.where.not(limit: nil).pluck(:id)
    # @special_tasks = Task.where(id: special_task_ids).where('limit >= ?', Date.today)




  def new
    @task =Task.new
  end

  def create
  # Task.create(task_params)
    @task =Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "新規作成しました！"
    else
       render :new
    end
  end

  def show
    # @task = Task.find(params[:id])
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
      @task.destroy
      redirect_to tasks_path, notice: "削除しました!"
  end





  private
  def task_params
    params.require(:task).permit(:name, :detail, :limit, :status)
  end

  def set_task
   @task = Task.find(params[:id])
  end
end
