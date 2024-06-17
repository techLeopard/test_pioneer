class FlowsController < ApplicationController
  def index
    @flows = Flow.all
  end

  def new
    @flow = Flow.new
  end

  def create
    @flow = Flow.new(flow_params)
    if @flow.save
      redirect_to @flow, notice: 'Flow was successfully created.'
    else
      render :new
    end
  end

  def show
    set_flow
  end

  def edit
    set_flow
  end

  def update
    set_flow
    if @flow.update(flow_params)
      redirect_to @flow, notice: 'Flow was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_flow
    @flow.destroy
    redirect_to flows_url, notice: 'Flow was successfully destroyed.'
  end

  private 
  def set_flow
    @flow = Flow.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flow_params
    params.require(:flow).permit(:title, :completed, :description)
  end

end
