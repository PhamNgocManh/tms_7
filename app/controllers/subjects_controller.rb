class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end
  def show
    @subject = Subject.find params[:id]
  end
  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Added new subject"
      redirect_to @subject
    else
      render 'new'
    end
  end
  def index
    @subjects = Subject.all
  end
  def edit
    @subject = Subject.find params[:id]
  end
  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      #
     # debugger
     redirect_to @subject
    else
      render 'edit'
    end
  end
  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted"
    redirect_to subjects_url
  end
  private
    def subject_params
      params.require(:subject).permit(:name, :start_at)
    end
end
