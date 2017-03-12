class Sensitivy < ApplicationRecord
  # Direct associations

  has_many   :ingredient_sensitivities,
             :foreign_key => "sensitivity_id",
             :dependent => :destroy

  has_many   :user_sensitivies,
             :foreign_key => "sensitivity_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
