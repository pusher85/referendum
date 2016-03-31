class RilevazionisController < ApplicationController
  #before_action :set_rilevazioni, only: [:show, :edit, :update, :destroy]

  def index
    @seggio = Seggi.find(params[:seggi_id])
    #@rilevazionis = Rilevazioni.where(seggi_id: @seggio)
  end

  def show
  end

  def new
    @seggio = Seggi.find(params[:seggi_id])
    @rilevazioni = Rilevazioni.new
  end

  def edit
  end

  def create
    @seggio = Seggi.find(params[:seggi_id])
    @rilevazioni = Rilevazioni.new(rilevazioni_params)
    @rilevazioni.seggi_id = @seggio.id

    if @rilevazioni.save
      redirect_to root_path
    else
      render new
    end
  end

  def update
    respond_to do |format|
      if @rilevazioni.update(rilevazioni_params)
        format.html { redirect_to @rilevazioni, notice: 'Rilevazioni was successfully updated.' }
        format.json { render :show, status: :ok, location: @rilevazioni }
      else
        format.html { render :edit }
        format.json { render json: @rilevazioni.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rilevazioni.destroy
    respond_to do |format|
      format.html { redirect_to rilevazionis_url, notice: 'Rilevazioni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rilevazioni
      @rilevazioni = Rilevazioni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rilevazioni_params
      params.require(:rilevazioni).permit(:seggi_id, :uno_m, :uno_f, :due_m, :due_f, :tre_m, :tre_f)
    end
end
