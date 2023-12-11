class ToolSectionsController < ApplicationController
    before_action :set_position
  
  # GET /section
    def index
      @tool_sections = @position.tool_sections
    end
  
    # GET /sections/:id
    def show
      @tool_section = ToolSection.find(params[:id])
    end
  
    # GET /sections/new
    def new
      @tool_section = ToolSection.new
    end
  
    # POST /sections
    def create
      @tool_section = @position.tool_sections.build(tool_section_params)
      if @tool_section.save
        redirect_to position_tool_section_path(@position, @tool_section), notice: 'Tool section was successfully created.'
      else
        render :new
      end
    end
  
    # GET /sections/:id/edit
    def edit
      @tool_section = ToolSection.find(params[:id])
    end
  
    # PATCH/PUT /sections/:id
    def update
      @tool_section = ToolSection.find(params[:id])
      if @tool_section.update(tool_section_params)
        redirect_to [@position]
      else
        render :edit
      end
    end
  
    # DELETE /sections/:id
    def destroy
      @tool_section = ToolSection.find(params[:id])
      @tool_section.destroy
  
      redirect_to position_path
    end
  
    
    private
  
    def set_position
      @position = Position.find(params[:position_id])
      redirect_to positions_path, notice: 'Position not found.' unless @position
    end
  
    def tool_section_params
      params.require(:tool_section).permit(:title)
    end
  end
  