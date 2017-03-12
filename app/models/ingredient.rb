class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :ingredient_sensitivities,
             :dependent => :destroy

  has_many   :recipe_ingredients,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
