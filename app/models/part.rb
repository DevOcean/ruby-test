class Part < ApplicationRecord
  has_many :options
  has_many :customizations

  validates :name, :category, presence: true
end
