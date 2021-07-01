class TasksController < ApplicationController
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
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "更新しました！"
    else
      render :edit
    end
  end



  private
  def task_params
    params.require(:task).permit(:name, :detail)
  end
end
