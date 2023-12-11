class ToolsController < ApplicationController
  
  before_action :set_position
  before_action :set_tool_section
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @tool = @tool_section.tools.build
  end

  def create
    @tool = @tool_section.tools.build(tool_params)
    if @tool.save
      redirect_to [@position, @tool_section, @tool], notice: 'Статья успешно создана.'
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @tool.update(tool_params)
      redirect_to position_tool_section_tool_path(@position, @tool_section, @tool), notice: 'Tool успешно обновлен.'
    else
      render :edit
    end
  end

 
  def destroy
    @tool.destroy
    redirect_to position_tool_section_path(@position, @tool_section), notice: 'Tool успешно удален.'
  end

  private

  def set_position
    @position = Position.find(params[:position_id])
  end

  # Установка раздела
  def set_tool_section
    @tool_section = ToolSection.find(params[:tool_section_id])
  end

  # Установка статьи
  def set_tool
    @tool = @tool_section.tools.find(params[:id])
  end

  # Strong parameters
  def tool_params
    params.require(:tool).permit(:title, :description, :category, :documentation_link, :logo_path, :platform, :history, :tool_section_id)
  end
end
