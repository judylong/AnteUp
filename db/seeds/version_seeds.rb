names_response = HTTParty.get('http://yugiohprices.com/api/card_names').body
names = JSON.parse(names_response)

names.each do |name|
  enc_name = URI.encode_www_form_component(name)
  versions_resp = HTTParty.get(URI.encode(%{http://yugiohprices.com/api/card_versions/#{enc_name}})).body
  versions_data = JSON.parse(versions_resp)['data']
  card = Card.where({name: name})[0]
  versions_data.each do |version|
    card.versions.create(
      set_name: version['name'],
      print_tag: version['print_tag'],
      rarity: version['rarity'],
    )
  end
end
