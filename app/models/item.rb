class Item < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :carts
end
