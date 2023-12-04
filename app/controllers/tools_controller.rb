class ToolsController < ApplicationController

# GET /tools
def index
    @tools = Tool.all
  end

  # GET /tools/:id
  def show
    @tool = Tool.find(params[:id])

    redirect_to tools_path, alert: 'Tool not found' if @tool.nil?
  end

  # GET /tools/new
  def new
    @tool = Tool.new
  end

  # POST /tools
  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tools_path
    else
      render :new
    end
  end

  # GET /tools/:id/edit
  def edit
    @tool = Tool.find(params[:id])
  end

  # PATCH/PUT /tools/:id
  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to @tool
    else
      render :edit
    end
  end

  # DELETE /tools/:id
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

  private
  def tool_params
    params.require(:tool).permit(:title, :logo_path, :category, :platform, :documentation_link, :description, :history )
  end

end
