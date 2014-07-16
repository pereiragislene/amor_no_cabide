#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      state_obj = State.new(:acronym => state["acronym"], :name => state["name"])
      state_obj.save

      state["cities"].each do |city|
        c = City.new
        c.name = city
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
      end
    end
  end
end

BRPopulate.populate

=begin
  1.times do |i|
  Ponto.create(logradouro: "Av. Souza Melo, 1043", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua da República,299", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua José Bonifácio, 645", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Av. André da Rocha", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Avenida Dom Pedro II, 1220", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Santo Antônio, 746", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Santana, 549", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Avenida Venancio Aires, 303", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Costa, 120", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Eudoro Berlink, 434", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Inácio de Fraga, 55", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rincão da Querencia, 904", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Praça Daltro Filho", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Avenida Borges de Medeiros, 1224", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Av. Irmãos Ko Freitag", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Praça Marcondes Ferraz", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Avenida Ramiro Barcelos, 1924", cidade: "Porto Alegre", estado: "RS")
  Ponto.create(logradouro: "Rua Rafael Saadi, 200", cidade: "Porto Alegre", estado: "RS")
=end
