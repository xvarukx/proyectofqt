class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #before_action -> { allow_roles [:admin]}
  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end
  
  def new
    @task = Task.new
    @schools = School.select(:id, :name, :zone_id)
    respond_with(@task)
  end

  def edit
    @schools = School.select(:id, :name, :zone_id)
  end

  def create
    @task = Task.new(task_params)
    users = @task.team.users
  
    if @task.save
      users.each do |user| 
        UserMailer.message_new_task(user, @task).deliver
      end
    end 
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end
  def update_status
    id = params[:task_id]
    task = Task.find(id)
    status = params[:task_status]
    case status
      when 'null'
        status = 'Sin Empezar'
      when 'progress'
        status = 'En Proceso'
      when 'finished'
        status = 'Terminada'
    end
    task.update_attribute(:state, status);
    respond_to do |format|
      format.json {
        render json: {task: task}
      }
    end
  end
  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :state, :task_date, :team_id, school_ids: [])
    end
end
