class SectionsController < ApplicationController
  before_action :set_position

# GET /sections

  # GET /sections/:id
  def show
    @section = Section.find(params[:id])
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # POST /sections
  def create
    @section = @position.sections.build(section_params)
    if @section.save
      redirect_to position_section_path(@position, @section), notice: 'Section was successfully created.'
    else
      render :new
    end
  end

  # GET /sections/:id/edit
  def edit
    @section = Section.find(params[:id])
  end

  # PATCH/PUT /sections/:id
  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to [@position]
    else
      render :edit
    end
  end

  # DELETE /sections/:id
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to position_path
  end

  private


  def set_position
    @position = Position.find(params[:position_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end
end
