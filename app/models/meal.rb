class Meal < ApplicationRecord
  # Direct associations

  has_many   :cookbook_meals,
             :dependent => :destroy

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
