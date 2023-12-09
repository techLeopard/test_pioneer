class ArticlesController < ApplicationController
  
  before_action :set_position
  before_action :set_section
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /sections/:section_id/articles/:id
  def show
  end

  # GET /sections/:section_id/articles/new
  def new
    @article = @section.articles.build
  end

  # POST /sections/:section_id/articles
  def create
    @article = @section.articles.build(article_params)
    if @article.save
      redirect_to [@position, @section, @article], notice: 'Статья успешно создана.'
    else
      render :new
    end
  end

  # GET /sections/:section_id/articles/:id/edit
  def edit
    # @article уже установлен благодаря before_action
  end

  # PATCH/PUT /sections/:section_id/articles/:id
  def update
    if @article.update(article_params)
      redirect_to position_section_article_path(@position, @section, @article), notice: 'Статья успешно обновлена.'
    else
      render :edit
    end
  end

  # DELETE /sections/:section_id/articles/:id
  def destroy
    @article.destroy
    redirect_to position_section_path(@position, @section), notice: 'Статья успешно удалена.'
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
    @article = @section.articles.find(params[:id])
  end

  # Strong parameters
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
