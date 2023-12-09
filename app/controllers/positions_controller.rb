class PositionsController < ApplicationController
    def index 
        @positions = Position.all
    end

    def show
        @position = Position.find(params[:id])
        @sections = @position.sections.includes(:articles) 
    end

end
