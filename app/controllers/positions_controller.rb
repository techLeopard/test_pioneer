class PositionsController < ApplicationController
    
    def index 
        @positions = Position.all
    end

    def show
        @position = Position.find_by(id: params[:id])
        if @position
          @sections = @position.sections
          @tool_sections = @position.tool_sections
        else
          redirect_to positions_path, alert: 'Position not found'
        end
    end
      

end
