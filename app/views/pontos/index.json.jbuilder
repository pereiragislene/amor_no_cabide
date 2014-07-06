json.array!(@pontos) do |ponto|
  json.extract! ponto, :id, :latitude, :longitude, :logradouro, :cidade, :estado, :cep
  json.url ponto_url(ponto, format: :json)
end
