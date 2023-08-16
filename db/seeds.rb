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

Museum.destroy_all

# SEED EXEMPLE
Museum.create!(
  name: "Musée d'Orsay",
  address: "1, rue de la Légion d'Honneur, Paris",
  country: "France",
  visitors: 3555555
)

url = "https://www.wikiwand.com/fr/Liste_des_mus%C3%A9es_d%27art_les_plus_visit%C3%A9s_au_monde"

response = HTTParty.get(url)
html = response.body

doc = Nokogiri::HTML(html)

td_elements = doc.css('table tbody tr td')
td_elements.each do |td|
  puts td.text
end

museums_data = []

td_elements.each_slice(5) do |tds|
  museum = {
    name: tds[1].text.strip,
    address: tds[2].text.strip,
    country: tds[3].text.strip,
    visitors: tds[4].text.to_i
  }
  museums_data << museum
end

museums_data.each do |museum|
  Museum.create!(
    name: museum[:name],
    address: museum[:address],
    country: museum[:country],
    visitors: museum[:visitors]
  )
end
