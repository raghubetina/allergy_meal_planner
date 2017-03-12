class Recipe < ApplicationRecord
  # Direct associations

  has_many   :meal_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
