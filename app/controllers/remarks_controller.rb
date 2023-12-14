class RemarksController < ApplicationController
  before_action :set_remark, only: [:show, :edit, :update, :destroy]

  def index
    @remarks = Remark.all
  end

  def show
  end

  def new
    @remark = Remark.new
  end

  # POST /notes
  def create
    @remark = Remark.new(remark_params)

    if @remark.save
      redirect_to @remark, notice: 'Remark was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @remark.update(remark_params)
      redirect_to @remark, notice: 'Remark was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @remark.destroy
    redirect_to interview_remarks_url, notice: 'Remark was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remark
      @remark = Remark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def remark_params
      params.require(:remark).permit(:title, :content)
    end
end
