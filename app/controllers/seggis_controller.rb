class SeggisController < ApplicationController
  before_action :set_seggi, only: [:show, :edit, :update, :destroy]

  # GET /seggis
  # GET /seggis.json
  def index
    @seggis = Seggi.all.order(:numero)
    
    
  end

  # GET /seggis/1
  # GET /seggis/1.json
  def show
    @iscritti = @seggi.maschi + @seggi.femmine
    @votanti1 = @seggi.prima ? (@seggi.prima.maschi + @seggi.prima.femmine) : '0'
    @votanti2 = @seggi.seconda ? (@seggi.seconda.maschi + @seggi.seconda.femmine) : '0'
    @votanti3 = @seggi.terza ? (@seggi.terza.maschi + @seggi.terza.femmine) : '0'
    #@votanti_tot = @votanti1.to_i + @votanti2.to_i + @votanti3.to_i
    #@votanti_tot = @votanti3 ? @votanti3 : (@votanti2 ? @votanti2 : @votanti1)

    @votanti_tot =  if @votanti3 != '0'
                        @votanti3
                    else 
                      if @votanti2 != '0'
                        @votanti2
                      else 
                        if @votanti1 != '0'
                          @votanti1                        
                        else
                          '0'
                        end
                      end
                    end
    
    @perc1 = (@votanti1 * 100 / @iscritti.to_f).to_i if @seggi.prima
    @perc2 = (@votanti2 * 100 / @iscritti.to_f).to_i if @seggi.seconda
    @perc3 = (@votanti3 * 100 / @iscritti.to_f).to_i if @seggi.terza
    @percentuale_tot = (@votanti_tot.to_f * 100 / @iscritti.to_f).to_i

    #number_to_percentage(@percentuale_tot, precision: 2 )

  end

  # GET /seggis/new
  def new
    @seggi = Seggi.new
  end

  # GET /seggis/1/edit
  def edit
  end

  # POST /seggis
  # POST /seggis.json
  def create
    @seggi = Seggi.new(seggi_params)

    respond_to do |format|
      if @seggi.save
        format.html { redirect_to @seggi, notice: 'Seggi was successfully created.' }
        format.json { render :show, status: :created, location: @seggi }
      else
        format.html { render :new }
        format.json { render json: @seggi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seggis/1
  # PATCH/PUT /seggis/1.json
  def update
    respond_to do |format|
      if @seggi.update(seggi_params)
        format.html { redirect_to @seggi, notice: 'Seggi was successfully updated.' }
        format.json { render :show, status: :ok, location: @seggi }
      else
        format.html { render :edit }
        format.json { render json: @seggi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seggis/1
  # DELETE /seggis/1.json
  def destroy
    @seggi.destroy
    respond_to do |format|
      format.html { redirect_to seggis_url, notice: 'Seggi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seggi
      @seggi = Seggi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seggi_params
      params.require(:seggi).permit(:descrizione, :numero, :maschi, :femmine)
    end
end
