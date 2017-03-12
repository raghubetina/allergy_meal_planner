class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :recipe_ingredients,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
