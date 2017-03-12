class Sensitivy < ApplicationRecord
  # Direct associations

  has_many   :ingredient_sensitivities,
             :foreign_key => "sensitivity_id",
             :dependent => :destroy

  has_many   :user_sensitivies,
             :foreign_key => "sensitivity_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :user_sensitivies,
             :source => :user

  has_many   :ingredients,
             :through => :ingredient_sensitivities,
             :source => :ingredient

  # Validations

end
