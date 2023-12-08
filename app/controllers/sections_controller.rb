class SectionsController < ApplicationController

# GET /sections
  def index
    @sections = Section.all
  end

  # GET /sections/:id
  def show
    @section = Section.find(params[:id])

    redirect_to interview_wikipedia_path
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # POST /sections
  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to @section
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
      redirect_to @section
    else
      render :edit
    end
  end

  # DELETE /sections/:id
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to sections_path
  end

  private
  def section_params
    params.require(:section).permit(:title, :description)
  end
end
