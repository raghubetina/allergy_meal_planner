class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :ingredient_sensitivities,
             :dependent => :destroy

  has_many   :recipe_ingredients,
             :dependent => :destroy

  # Indirect associations

  has_many   :sensitivities,
             :through => :ingredient_sensitivities,
             :source => :sensitivity

  has_many   :recipes,
             :through => :recipe_ingredients,
             :source => :recipe

  # Validations

end
