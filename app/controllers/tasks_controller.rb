class TasksController < ApplicationController
  def index
    

  end

  def new
    @task =Task.new
  end

  def create
  Task.create(task_params)
  redirect_to new_task_path
  end



  private
  def task_params
    prams.require(:task).permit(:name, :detail)
  end
end
