class FeaturesController < ApplicationController
    before_action :set_tool
    before_action :set_feature, only: [:show, :edit, :update, :destroy]
  
    def new
      @tool = Tool.find(params[:tool_id])
      @feature = @tool.features.build
    end
    
    def show
    end

    def create
      @tool = Tool.find(params[:tool_id])
      @feature = @tool.features.build(feature_params)
      if @feature.save
        redirect_to tool_path(@tool), notice: 'Feature was successfully created.'
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
      redirect_to tool_features_path(@tool), notice: 'Feature was successfully destroyed.'
    end
  
    private
  
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
  