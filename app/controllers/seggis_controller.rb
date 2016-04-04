class SeggisController < ApplicationController
  before_action :set_seggi, only: [:show, :edit, :update, :destroy]
  #before_action :quadra_seggi, only: [:show, :index]

  # GET /seggis
  # GET /seggis.json
  def index
    @titolo = 'Stato delle rilevazioni per saggio'
    @seggis = Seggi.all.order(:numero).each

    #@seggi = Seggi.all
    #@quadra_1 = @seggi.prima ? ((@seggi.prima.maschi > @seggi.maschi) || (@seggi.prima.femmine > @seggi.femmine) ? false : true) : false
    #@quadra_2 = @seggi.seconda ? ((@seggi.seconda.maschi > @seggi.maschi) || (@seggi.seconda.femmine > @seggi.femmine) || (@seggi.seconda.maschi <= @seggi.prima.maschi) || (@seggi.seconda.femmine <= @seggi.prima.femmine) ? false: true) : false
    #@quadra_3 = @seggi.terza ? ((@seggi.terza.maschi > @seggi.maschi) || (@seggi.terza.femmine > @seggi.femmine) || (@seggi.terza.maschi <= @seggi.seconda.maschi) || (@seggi.terza.femmine <= @seggi.seconda.femmine) ? false : true) : false
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
    
    @perc1 = (@votanti1 * 100 / @iscritti.to_f).to_f if @seggi.prima
    @perc2 = (@votanti2 * 100 / @iscritti.to_f).to_f if @seggi.seconda
    @perc3 = (@votanti3 * 100 / @iscritti.to_f).to_f if @seggi.terza
    @percentuale_tot = (@votanti_tot.to_f * 100 / @iscritti.to_f).to_f

    if @seggi.finale
      @validi = @seggi.finale.si + @seggi.finale.no
      @si_perc = ((100 * @seggi.finale.si / @validi.to_f ).to_f).round(2)
      @no_perc = ((100 * @seggi.finale.no / @validi.to_f ).to_f).round(2)
    end


    @quadra_1 = @seggi.prima ? ((@seggi.prima.maschi > @seggi.maschi) || (@seggi.prima.femmine > @seggi.femmine) ? false : true) : true
    @quadra_2 = @seggi.seconda ? ((@seggi.seconda.maschi > @seggi.maschi) || (@seggi.seconda.femmine > @seggi.femmine) || (@seggi.seconda.maschi <= @seggi.prima.maschi) || (@seggi.seconda.femmine <= @seggi.prima.femmine) ? false: true) : true
    @quadra_3 = @seggi.terza ? ((@seggi.terza.maschi > @seggi.maschi) || (@seggi.terza.femmine > @seggi.femmine) || (@seggi.terza.maschi <= @seggi.seconda.maschi) || (@seggi.terza.femmine <= @seggi.seconda.femmine) ? false : true) : true

    #number_to_percentage(@percentuale_tot, precision: 2 )

  end

  # GET /seggis/new
  def new
    @titolo = 'Inserimento nuovo seggio'
    @seggi = Seggi.new
  end

  # GET /seggis/1/edit
  def edit
    @titolo = 'Modifica del seggio'
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

  def scrutini

  end

  #--------------------------------------------------------------------------------------------------

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seggi
      @seggi = Seggi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seggi_params
      params.require(:seggi).permit(:descrizione, :numero, :maschi, :femmine, :speciale)
    end

    def quadra_seggi
      @quadra_1 = @seggi.prima ? ((@seggi.prima.maschi > @seggi.maschi) || (@seggi.prima.femmine > @seggi.femmine) ? false : true) : false
      @quadra_2 = @seggi.seconda ? ((@seggi.seconda.maschi > @seggi.maschi) || (@seggi.seconda.femmine > @seggi.femmine) || (@seggi.seconda.maschi <= @seggi.prima.maschi) || (@seggi.seconda.femmine <= @seggi.prima.femmine) ? false: true) : false
      @quadra_3 = @seggi.terza ? ((@seggi.terza.maschi > @seggi.maschi) || (@seggi.terza.femmine > @seggi.femmine) || (@seggi.terza.maschi <= @seggi.seconda.maschi) || (@seggi.terza.femmine <= @seggi.seconda.femmine) ? false : true) : false
    end
end
