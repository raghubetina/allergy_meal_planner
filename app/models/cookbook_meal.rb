class CookbookMeal < ApplicationRecord
  # Direct associations

  belongs_to :cookbook

  belongs_to :meal

  # Indirect associations

  # Validations

end
