class TasksController < ApplicationController
  def index
    @my_task = Task.all
  end

  def show
    @result_task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to tasks_path
    end
    # task.save

  end

  def completed
    task = Task.find(params[:id])
    if task.completed == false
      task.completed = true
    else
      task.completed = false
      #task.completion_date = Time.now
    end
    task.save

    redirect_to tasks_path
  end

  def new
    @task = Task.new
  end

  def create
  task = Task.create task_params

    unless task.id == nil

      redirect_to tasks_path
    end
  end

  def destroy
    Task.destroy(params[:id])

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :completion_date)
  end

end
