FactoryGirl.define do
  factory :card do
    name { Faker::Name.name}
    card_text { Faker::Lorem.sentence }
    card_type { Faker::Team.creature }
  end

end
