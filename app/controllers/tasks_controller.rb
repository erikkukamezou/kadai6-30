class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    # @label_list = Label.all
    @tasks = current_user.tasks.page(params[:page]).per(5)
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    # @tasks =Task.page(params[:page]).per(PER)
    # @tasks = @tasks.current_user.page(params[:page]).per(5)


      @tasks = @tasks.order(:limit) if params[:sort_limit]

    # @tasks = Task.all

      @tasks = @tasks.order(:priority) if params[:sort_priority]

      # @tasks =Task.page(params[:page]).per(5)
    #  else
      #  @tasks = @tasks.order(:created_at)
    #  end

# もし渡されたパラメータがタイトルのみだったとき
      #if params[:task].present?
      # @tasks = @tasks.where('name LIKE ?', "%#{params[:name]}%") if params[:name].present?
      @tasks = @tasks.search_by_name(params[:name]) if params[:name].present?
      # もし渡されたパラメータがステータスのみだったとき
      # @tasks = @tasks.where('status LIKE ?', "%#{params[:status]}%") if params[:status].present?
      # @tasks = @tasks.where(status: params[:status]) if params[:status].present?
      @tasks = @tasks.search_by_status(params[:status]) if params[:status].present?
# もし渡されたパラメータがタイトルとステータス両方だったとき

    #  end
     #    if params[:task][:name].present? && params[:task][:status].present?
     #      @tasks = @tasks.where('name LIKE ?', "%#{params[:task][:name]}%")
     #      @tasks =@tasks.where(status: params[:task][:status])
     # #
     #    elsif params[:task][:name].present?
     #      @tasks = @tasks.where('name LIKE ?', "%#{params[:task][:name]}%")
     # #
     # #    elsif params[:task][:status].present?
     # #      @tasks =@tasks.where(status: params[:task][:status]
     #    end
     #  end
    # @tasks = @tasks.search(params[:search])
  end

  # def search
  #   @tasks = Task.search(params[:search])
  #   # @keyword = params[:keyword]
  #   render "index"
  # end
  #
  # def priority
  #   @tasks = Task.priority(params[:priority])
  #   render "index"
  # end

#   def search
#     @tasks = Task.search(params[:search, :status])
#     # @ = params[:search, :status]
#     render "index"
#
# 　end

    # if params[:sort_expired]
    #   @tasks = Task.all.order(deadline: :desc)
    # end
    #
    # special_task_ids = Task.where.not(limit: nil).pluck(:id)
    # @special_tasks = Task.where(id: special_task_ids).where('limit >= ?', Date.today)
  def new
    @task = Task.new
    # @labels=Label.all
  end

  def create
  # Task.create(task_params)
    @task = Task.new(task_params)
    # @label_ids = params[:task][:label_ids]
    # @label_ids.shift
    # label_list = params[:task][:label_list].split(",")
    @task.user_id = current_user.id
    if @task.save
     # @label_ids.each do |labe_id|
     #   label = Label.find(label_id.to_i)
     #   @task.labels << label
     # end
      # @task.label_save(label_list)
      redirect_to tasks_path, notice: "新規作成しました！"
    else
       render :new
    end
  end

  def show
    # @task = Task.find(params[:id])
    # @task_labels = @task.labels
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
  #
  # def search
  #   if params[:name].present?
  #     @tasks = Task.where('name LIKE ?', "%#{params[:name]}%")
  #   else
  #     @tasks = Task.none
  #   end
  # end

  private
  def task_params
    params.require(:task).permit(:name, :detail, :limit, :status, :search, :priority, { label_ids: [] })
  end

  def set_task
   @task = Task.find(params[:id])
  end
end
