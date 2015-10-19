require 'rails_helper'

RSpec.describe Version, type: :model do
  describe "model methods" do
  end

  describe "validations" do
    subject { FactoryGirl.build(:version) }

    it { should validate_uniqueness_of(:print_tag) }

    it { should validate_presence_of(:card_id) }
    it { should validate_presence_of(:set_name) }
    it { should validate_presence_of(:print_tag) }
    it { should validate_presence_of(:rarity) }
  end

  describe "associations" do
    it { should belong_to(:card) }
  end

  describe "error messages" do
    it "fails validation with no card_id expecting a specific message" do
      no_card_id_version = Version.new()
      no_card_id_version.valid?
      expect(no_card_id_version.errors[:card_id]).to include("can't be blank")
    end

    it "fails validation with no set_name expecting a specific message" do
      no_set_name_version = Version.new()
      no_set_name_version.valid?
      expect(no_set_name_version.errors[:set_name]).to include("can't be blank")
    end

    it "fails validatoin with no print_tag expecting a specific message" do
      no_print_tag_version = Version.new()
      no_print_tag_version.valid?
      expect(no_print_tag_version.errors[:print_tag]).to include("can't be blank")
    end
  end
end
