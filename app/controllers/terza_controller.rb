class TerzaController < ApplicationController
	def new
		@seggio = Seggi.find(params[:seggi_id])
		@terza = Terza.new
	end


	def create
		@seggio = Seggi.find(params[:seggi_id])
		@terza = Terza.new(terza_params)
		@terza.seggi_id = @seggio.id
		if @terza.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
		@seggio = Seggi.find(params[:seggi_id])
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
  end

  def update
  	@seggio = Seggi.find(params[:seggi_id])
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
  	if @terza.update(terza_params)
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@seggio = Seggi.find(params[:seggi_id])
  	@terza = Terza.where(:seggi_id => @seggio).find(params[:id])
  	@terza.destroy
  	redirect_to root_path
  end


  private
  	def terza_params
  		params.require(:terza).permit(:seggi_id, :maschi, :femmine)
  	end
end
