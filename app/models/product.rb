class Product < ApplicationRecord
  has_many :customizations
  has_many :parts, through: :customizations

  validates :name, :price, :category, presence: true
  validates :price, numericality: { greater_than: 0 }
end
