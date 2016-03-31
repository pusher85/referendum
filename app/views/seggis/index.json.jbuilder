json.array!(@seggis) do |seggi|
  json.extract! seggi, :id, :descrizione, :numero, :maschi, :femmine
  json.url seggi_url(seggi, format: :json)
end
