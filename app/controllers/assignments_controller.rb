class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  
    def index
      @assignments = Assignment.all
    end
  
    def show
    end
  
    def new
      @assignment = Assignment.new
    end
  
    def create
      @assignment = Assignment.new(assignment_params)
      if @assignment.save
        redirect_to @assignment, notice: 'Задание успешно создано.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @assignment.update(assignment_params)
        redirect_to @assignment, notice: 'Задание успешно обновлено.'
      else
        render :edit
      end
    end
  
    def destroy
      @assignment.destroy
      redirect_to assignments_path, notice: 'Задание успешно удалено.'
    end
  
    private
  
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
  
    def assignment_params
      params.require(:assignment).permit(:title, :company_name, :link, :content)
    end
  end
  