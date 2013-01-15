class TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.all
  end

  def create
    params[:task][:priority] = Task.incompleteTasks.size + 1
    respond_with Task.create(params[:task])
  end

  def update
    task = Task.find(params[:id])
    start = task.priority
    last = params[:task][:priority].to_i
    if start != last
      Task.update_priority(params[:task][:priority].to_i, task.priority)
    elsif !task.completed and params[:task][:completed]
      Task.update_priority(params[:task][:priority].to_i, Task.incompleteTasks.size)
    elsif task.completed and !params[:task][:completed]
      params[:task][:priority] = Task.incompleteTasks.size
    end 
    respond_with task.update_attributes(params[:task])
  end

  def destroy
    task = Task.find(params[:id])
    puts task.priority
    puts Task.incompleteTasks.size
    if !task.completed
      Task.update_priority(task.priority, Task.incompleteTasks.size)
    end
    respond_with task.destroy
  end

end
