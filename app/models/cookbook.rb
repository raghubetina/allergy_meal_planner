class Cookbook < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "UserSensitivy"

  # Indirect associations

  # Validations

end
