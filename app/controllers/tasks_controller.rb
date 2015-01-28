class TasksController < ApplicationController
  #before_action :logged_in, only: [:create, :edit, :update, :destroy]
  def create
    @task = Task.new task_params
    if @task.save
      flash[:success] = "Task created!"
      redirect_to request.referer
    else
      render root_url
    end
  end

  def edit
    @task = Task.find params[:id]
    @subject = Subject.find subject_id = @task.subject_id
  end

  def update
    @task = Task.find params[:id]
    @subject = Subject.find subject_id = @task.subject_id
    if @task.update_attributes task_params
     redirect_to @subject
    else
      render "edit"
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted"
    redirect_to request.referer
  end
  
  private
    def task_params
      params.require(:task).permit(:name, :subject_id)
    end
end
