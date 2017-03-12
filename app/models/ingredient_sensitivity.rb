class IngredientSensitivity < ApplicationRecord
  # Direct associations

  belongs_to :sensitivity,
             :class_name => "Sensitivy"

  belongs_to :ingredient

  # Indirect associations

  # Validations

end
