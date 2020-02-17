class NotesController < ApplicationController
	before_action :authenticate_user!

	def index 
		@notes=current_user.note.all
	end

	def show 
		@note=current_user.note.find(params[:id])
	end

	def new
		@note=current_user.note.new
	end

	def create
		#render plain: params[:notes].inspect
		@note=current_user.note.new(note_params)
		if(@note.save)
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
		@note=current_user.note.find(params[:id])
	end

	def update
		@note=current_user.note.find(params[:id])
		if(@note.update(note_params))
			redirect_to @note
		else
			render 'edit'
		end

	end

	def destroy 
		@note=current_user.note.find(params[:id])
		@note.destroy

		redirect_to @note
	end

	private def note_params
		params.require(:note).permit(:title,:note)
	end
end
