class Option < ApplicationRecord
  belongs_to :part

  validates :name, :stock, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
