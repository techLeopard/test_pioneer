class PostsController < ApplicationController

  before_action :set_position
  before_action :set_tool_section
  before_action :set_tool
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /tools/:tool_id/posts

  # GET /tools/:tool_id/posts/:id
  def show
  end
  

  # GET /tools/:tool_id/posts/new
  def new
    @post = @tool.posts.build
  end


  def create
    @post = @tool.posts.build(post_params)
    if @post.save
      redirect_to position_tool_section_tool_post_path(@position, @tool_section, @tool, @post), notice: 'Статья успешно создана.'
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @post.update(post_params)
      redirect_to position_tool_section_tool_post_path(@position, @tool_section, @tool, @post), notice: 'Статья успешно обновлена.'
    else
      render :edit
    end
  end



  def destroy
    @post.destroy
    redirect_to position_tool_section_tool_path(@position, @tool_section, @tool), notice: 'Статья успешно удалена.'
  end

  private
    # Установка позиции
    def set_position
      @position = Position.find(params[:position_id])
    end

    # Установка tool_section
    def set_tool_section
      @tool_section = ToolSection.find(params[:tool_section_id])
    end

    # Установка раздела
    def set_tool
      @tool = Tool.find(params[:tool_id])
    end

    # Установка статьи
    def set_post
      @post = @tool.posts.find(params[:id])
      redirect_to(root_url, alert: "Post not found.") if @post.nil?
    end
    

    # Strong parameters
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
