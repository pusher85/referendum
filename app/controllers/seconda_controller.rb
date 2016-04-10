class SecondaController < ApplicationController
	def new
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Seconda rilevazione per il seggio #{@seggio.numero}"
		@seconda = Seconda.new
	end


	def create
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Inserimento Seconda rilevazione per il seggio #{@seggio.numero}"
		@seconda = Seconda.new(seconda_params)
		@seconda.seggi_id = @seggio.id
		if @seconda.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
		@seggio = Seggi.find(params[:seggi_id])
    @titolo = "Modifica Seconda rilevazione per il seggio #{@seggio.numero}"
  	@seconda = Seconda.where(:seggi_id => @seggio).find(params[:id])
    @terza = true if @seggio.terza
  end

  def update
  	@seggio = Seggi.find(params[:seggi_id])
  	@seconda = Seconda.where(:seggi_id => @seggio).find(params[:id])
  	if @seconda.update(seconda_params)
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@seggio = Seggi.find(params[:seggi_id])
  	@seconda = Seconda.where(:seggi_id => @seggio).find(params[:id])
  	@seconda.destroy
  	redirect_to root_path
  end


  private
  	def seconda_params
  		params.require(:seconda).permit(:seggi_id, :maschi, :femmine)
  	end
end
