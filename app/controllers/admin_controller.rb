class AdminController < ApplicationController
	
	before_filter :authenticate_utenti!


	def index
		@utenti = Utenti.all.order(:email)

	end



	def new
		@titolo = "Creazione nuova login"
		@utenti = Utenti.new

	end

	def create
		@titolo = "Creazione nuova login"
		@utenti = Utenti.new(utenti_params)
		if @utenti.save
			redirect_to admin_index_path, notice: "Utente aggiunto"
		else
			render 'new'
		end
	end

		def edit
		@titolo = "Modifica Login"
		@utenti = Utenti.find(params[:id])
	end

	def update
		@utenti = Utenti.find(params[:id])

		if params[:utentis][:password].blank?
			params[:utentis].delete(:password)
		end

		if @utenti.update(utenti_params)
			redirect_to admin_index_path
		else
			render 'edit'
		end
	end

		def destroy
		@utenti = Utenti.find(params[:id])
		@utenti.destroy
		redirect_to admin_index_path, notice: "Login eliminata con successo!"
	end


	private
		def utenti_params
			params.require(:utentis).permit( :email, :password)
		end

end
