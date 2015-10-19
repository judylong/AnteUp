FactoryGirl.define do
  factory :version do
    card_id { Faker::Number.number(3) }
    set_name { Faker::Team.name }
    print_tag { Faker::Address.street_address }
    rarity { Faker::Company.catch_phrase}
  end

end
