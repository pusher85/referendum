class TerzaController < ApplicationController
  before_filter :authenticate_utenti!
  
	def new
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Terza rilevazione per il seggio #{@seggio.numero}"
		@terza = Terza.new
	end


	def create
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Terza rilevazione per il seggio #{@seggio.numero}"
		@terza = Terza.new(terza_params)
		@terza.seggi_id = @seggio.id
		if @terza.save
			redirect_to seggis_path
		else
			render 'new'
		end
	end


	def edit
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Modifica Terza rilevazione per il seggio #{@seggio.numero}"
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
    @finale = true if @seggio.finale
  end

  def update
  	@seggio = Seggi.find(params[:seggi_id])
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
  	if @terza.update(terza_params)
  		redirect_to seggis_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@seggio = Seggi.find(params[:seggi_id])
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
  	@terza.destroy
  	redirect_to seggis_path
  end


  private
  	def terza_params
  		params.require(:terza).permit(:seggi_id, :maschi, :femmine)
  	end
end
