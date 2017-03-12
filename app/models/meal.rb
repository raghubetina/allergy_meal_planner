class Meal < ApplicationRecord
  # Direct associations

  has_many   :cookbook_meals,
             :dependent => :destroy

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  has_many   :cookbooks,
             :through => :cookbook_meals,
             :source => :cookbook

  has_many   :recipes,
             :through => :meal_recipes,
             :source => :recipe

  # Validations

end
