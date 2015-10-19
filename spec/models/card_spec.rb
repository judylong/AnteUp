require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "model methods" do

  end

  describe "validations" do
    subject { FactoryGirl.build(:card) }

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:card_text)}
    it { should validate_presence_of(:card_type)}
  end

  describe "associations" do
    it { should have_many(:versions)}
  end

  describe "error messages" do
    it "fails validation with a non-unique name expecting a specific message" do
      FactoryGirl.create(:card, name: "Dark Magician") # or rake db:test:prepare
      non_unique_card = FactoryGirl.build(:card, {:name => "Dark Magician"})
      non_unique_card.valid?
      expect(non_unique_card.errors[:name]).to include("has already been taken")
    end

    it "fails validation with no name expecting a specific message" do
      no_name_card = Card.new()
      no_name_card.valid?
      expect(no_name_card.errors[:name]).to include("can't be blank")
    end

    it "fails validation with no card_text expecting a specific message" do
      no_card_text_card = Card.new()
      no_card_text_card.valid?
      expect(no_card_text_card.errors[:card_text]).to include("can't be blank")
    end

    it "fails validation with no card_type expecting a specific message" do
      no_card_type_card = Card.new()
      no_card_type_card.valid?
      expect(no_card_type_card.errors[:card_type]).to include("can't be blank")
    end
  end

end
