class FinaleController < ApplicationController
	

  def new
		@seggio = Seggi.find(params[:seggi_id])
		@finale = Finale.new
    @votanti = @seggio.terza.maschi + @seggio.terza.femmine
	end


	def create
		@seggio = Seggi.find(params[:seggi_id])
		@finale = Finale.new(finale_params)
		@finale.seggi_id = @seggio.id
		if @finale.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
		@seggio = Seggi.find(params[:seggi_id])
    @votanti = @seggio.terza.maschi + @seggio.terza.femmine
  	@finale = Finale.where(:seggi_id => @seggio).find(params[:id])
  end

  def update
  	@seggio = Seggi.find(params[:seggi_id])
  	@finale = Finale.where(:seggi_id => @seggio).find(params[:id])
  	if @finale.update(finale_params)
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@seggio = Seggi.find(params[:seggi_id])
  	@finale = Finale.where(:seggi_id => @seggio).find(params[:id])
  	@finale.destroy
  	redirect_to root_path
  end


  private
  	def finale_params
  		params.require(:finale).permit(:seggi_id, :si, :no, :bianche, :nulle, :contestate)
  	end
end
