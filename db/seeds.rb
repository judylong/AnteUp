# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

names_response = HTTParty.get('http://yugiohprices.com/api/card_names').body
names = JSON.parse(names_response)

names.each do |name|
  name = URI.encode_www_form_component(name)
  card_resp = HTTParty.get(URI.encode(%{http://yugiohprices.com/api/card_data/#{name}})).body
  card_data = JSON.parse(card_resp)['data']
  Card.create(
    name: card_data['name'],
    card_text: card_data['text'],
    card_type: card_data['card_type'],
    monster_type: card_data['type'],
    family: card_data['family'],
    attack: card_data['atk'],
    defense: card_data['def'],
    level: card_data['level'],
    property: card_data['property']
  )
end
