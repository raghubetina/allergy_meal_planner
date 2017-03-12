class Meal < ApplicationRecord
  # Direct associations

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
