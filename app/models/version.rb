class Version < ActiveRecord::Base
  validates :print_tag, uniqueness: { scope: [:rarity, :set_name] }
  validates :card_id, uniqueness: { scope: [:set_name, :print_tag, :rarity] }
  validates :card_id, :set_name, :print_tag, :rarity, presence: true

  belongs_to :card
end
