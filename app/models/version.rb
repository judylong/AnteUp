class Version < ActiveRecord::Base
  validates :print_tag, uniqueness: true
  validates :card_id, uniqueness: {scope: :set_name}
  validates :card_id, uniqueness: {scope: :print_tag}
  validates :card_id, :set_name, :print_tag, :rarity, presence: true

  belongs_to :card
end
