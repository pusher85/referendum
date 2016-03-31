json.array!(@rilevazionis) do |rilevazioni|
  json.extract! rilevazioni, :id, :seggi_id, :uno_m, :uno_f, :due_m, :due_f, :tre_m, :tre_f
  json.url rilevazioni_url(rilevazioni, format: :json)
end
