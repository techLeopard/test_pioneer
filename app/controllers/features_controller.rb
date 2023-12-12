class FeaturesController < ApplicationController

    before_action :set_position
    before_action :set_tool_section
    before_action :set_tool
    before_action :set_feature, only: [:show, :edit, :update, :destroy]
  
    def new
      @feature = @tool.features.build
    end
    
    def show
    end

    def create
      @feature = @tool.features.build(feature_params)
      if @feature.save
        redirect_to [@position, @tool_section, @tool], notice: 'Feature was successfully created.'
      else
        render :new
      end
    end

    def edit
    end
  
    def update
      if @feature.update(feature_params)
        redirect_to tool_feature_path(@tool, @feature), notice: 'Feature was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @feature.destroy
      redirect_to tool_path(@tool), notice: 'Feature was successfully destroyed.'
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
      @tool = Tool.find(params[:tool_id])
    end
  
    def set_feature
      @feature = @tool.features.find(params[:id])
    end
  
    def feature_params
      params.require(:feature).permit(:description)
    end
  end
  