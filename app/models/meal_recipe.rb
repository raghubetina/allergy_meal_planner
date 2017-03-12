class MealRecipe < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  belongs_to :meal

  # Indirect associations

  # Validations

end
