# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "nokogiri"
require "open-uri"
require 'httparty'
require "json"

Museum.destroy_all

# SEED EXEMPLE
Museum.create!(
  name: "Musée d'Orsay",
  address: "Paris",
  country: "France",
  visitors: 3_555_555
)

json_url = "https://www.data.gouv.fr/fr/datasets/r/a5c5d76e-979a-4073-ba0d-0844bb3c1398"
response = HTTParty.get(json_url)
museums_data = JSON.parse(response.body)



museums_data.each do |museum_data|
  fields = museum_data['fields']
  # puts fields
  name = fields['nomoff']

  # fields['adrl1_m'] = nil if fields['adrl1_m'] == ""
  # fields['ville_m'] = nil if fields['ville_m'] == ""
  fields['cp_m'] = nil if fields['cp_m'] == ""
  fields['categ'] = nil if fields['categ'] == ""

  address = fields['ville_m']

  # address = "#{fields['adrl1_m']}, #{fields['ville_m']}"
  zipcode = fields['cp_m']
  category = fields['categ']




  Museum.create!(
    name: name,
    address: address,
    zipcode: zipcode,
    category: category
  )
end
