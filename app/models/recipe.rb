class Recipe < ApplicationRecord
  # Direct associations

  has_many   :recipe_ingredients,
             :dependent => :destroy

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  has_many   :meals,
             :through => :meal_recipes,
             :source => :meal

  # Validations

  validates :name, :presence => true

end
