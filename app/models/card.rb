class Card < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :card_text, :card_type, presence: true

  has_many :versions
end
