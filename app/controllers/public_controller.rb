class PublicController < ApplicationController

	def corpo
		@titolo = 'Referendum sulle trivellazioni - 17 Aprile 2016'
		@seggio = Seggi.all.order(:numero)

		@tot_m = Seggi.all.sum(:maschi)
		@tot_f = Seggi.all.sum(:femmine)
		@totale = @tot_f + @tot_m
		
	end


	def affluenza
		@titolo = 'Dati Affluenza'
		#@seggio = Seggi.all
		#@prima_conteggio = @seggi.prima
		@votanti_iscritti = Seggi.sum(:maschi) + Seggi.sum(:femmine)
		@votanti_iscritti_m = Seggi.sum(:maschi)
		@votanti_iscritti_f = Seggi.sum(:femmine)
		@totale_seggi = Seggi.count
		
		@prima_conteggio = Prima.count
		@prima_votanti_num = Prima.sum(:maschi) + Prima.sum(:femmine)
		@prima_votanti_perc = (@prima_votanti_num * 100 / @votanti_iscritti.to_f).to_f
		@prima_votanti_m = Prima.sum(:maschi)
		@prima_votanti_f = Prima.sum(:femmine)

		@seconda_conteggio = Seconda.count
		@seconda_votanti_num = Seconda.sum(:maschi) + Seconda.sum(:femmine)
		@seconda_votanti_perc = (@seconda_votanti_num * 100 / @votanti_iscritti.to_f).to_f
		@seconda_votanti_m = Seconda.sum(:maschi)
		@seconda_votanti_f = Seconda.sum(:femmine)

		@terza_conteggio = Terza.count
		@terza_votanti_num = Terza.sum(:maschi) + Terza.sum(:femmine)
		@terza_votanti_perc = (@terza_votanti_num * 100 / @votanti_iscritti.to_f).to_f
		@terza_votanti_m = Terza.sum(:maschi)
		@terza_votanti_f = Terza.sum(:femmine)

	end

	def scrutini

	end

	def index
		#redirect_to public_affluenza_path
	end


	private

	def set_seggi
    @seggi = Seggi.find(params[:id])
  end
end
