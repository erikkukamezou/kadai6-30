class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks =Task.all

  end

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
    params.require(:task).permit(:name, :detail)
  end

  def set_task
   @task = Task.find(params[:id])
  end
end
