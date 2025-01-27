class Customization < ApplicationRecord
  belongs_to :product
  belongs_to :part
  belongs_to :option

  validate :validate_combinations

  private

  def validate_combinations
    if option.name == "Mountain Wheels" && part.name != "Full Suspension Frame"
      errors.add(:base, "Mountain Wheels require a Full Suspension Frame")
    elsif option.name == "Fat Bike Wheels" && option.name == "Red Rim"
      errors.add(:base, "Red Rim is not available for Fat Bike Wheels")
    end
  end
end
