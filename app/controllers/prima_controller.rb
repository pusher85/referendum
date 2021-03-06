class PrimaController < ApplicationController

  before_filter :authenticate_utenti!

  
	def new
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Prima rilevazione per il seggio #{@seggio.numero}"
		@prima = Prima.new

	end


	def create
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Prima rilevazione per il seggio #{@seggio.numero}"
		@prima = Prima.new(prima_params)
		@prima.seggi_id = @seggio.id
		if @prima.save
			redirect_to seggis_path
		else
			render 'new'
		end
	end


	def edit
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Modifica Prima rilevazione per il seggio #{@seggio.numero}"
  	@prima = Prima.where(:seggi_id => @seggio).find(params[:id])
    @seconda = true if @seggio.seconda
    #@terza = true if @seggi.terza
  end

  def update
  	@seggio = Seggi.find(params[:seggi_id])
  	@prima = Prima.where(:seggi_id => @seggio).find(params[:id])
  	if @prima.update(prima_params)
  		redirect_to seggis_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@seggio = Seggi.find(params[:seggi_id])
  	@prima = Prima.where(:seggi_id => @seggio).find(params[:id])
  	@prima.destroy
  	redirect_to seggis_path
  end


  private
  	def prima_params
  		params.require(:prima).permit(:seggi_id, :maschi, :femmine)
  	end
end
