class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
  
    # GET /notes
    def index
      @notes = Note.all
    end
  
    # GET /notes/:id
    def show
    end
  
    # GET /notes/new
    def new
      @note = Note.new
    end
  
    # POST /notes
    def create
      @note = Note.new(note_params)
  
      if @note.save
        redirect_to @note, notice: 'Note was successfully created.'
      else
        render :new
      end
    end
  
    # GET /notes/:id/edit
    def edit
    end
  
    # PATCH/PUT /notes/:id
    def update
      if @note.update(note_params)
        redirect_to @note, notice: 'Note was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /notes/:id
    def destroy
      @note.destroy
      redirect_to notes_url, notice: 'Note was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_note
        @note = Note.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def note_params
        params.require(:note).permit(:title, :content)
        # Замените :title и :content на реальные атрибуты вашей модели Note
      end
  end
  