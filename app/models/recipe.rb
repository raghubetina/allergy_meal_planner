class Recipe < ApplicationRecord
  # Direct associations

  has_many   :recipe_ingredients,
             :dependent => :destroy

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
