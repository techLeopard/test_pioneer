class PracticalTasksController < ApplicationController

    before_action :set_position
    before_action :set_section
    before_action :set_article
    before_action :set_practical_task, only: [:show, :edit, :update, :destroy]


    def index
      @practical_tasks = PracticalTask.all
    end

    def show
    end
  
    def new
      @practical_task = @article.practical_tasks.build
    end
  
    def create
      @practical_task = @article.practical_tasks.build(practical_task_params)
      if @practical_task.save
        redirect_to [@position, @section, @article, @practical_tasks], notice: 'Статья успешно создана.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @practical_task.update(practical_task_params)
        redirect_to position_section_article_practical_task_path(@position, @section, @article, @practical_task), notice: 'Task успешно обновлен.'
      else
        render :edit
      end
    end
  
    def destroy
      @practical_task.destroy
      redirect_to position_section_article_practical_tasks_path(@position, @section, @article, @practical_tasks), notice: 'Task успешно удален.'
    end
  
    private
  
    def set_position
      @position = Position.find(params[:position_id])
    end
  
    # Установка раздела
    def set_section
      @section = Section.find(params[:section_id])
    end
  
    # Установка статьи
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_practical_task
      @practical_task = @article.practical_tasks.find(params[:id])
    end
  
    # Strong parameters
    def practical_task_params
      params.require(:practical_task).permit(:title, :content)
    end
end
