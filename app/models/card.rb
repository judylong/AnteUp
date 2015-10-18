class Card < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :versions
end
