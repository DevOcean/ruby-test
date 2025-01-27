class Cart < ApplicationRecord
  has_many :cart_items
  has_many :customizations, through: :cart_items
end
