class UserSensitivy < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :sensitivity,
             :class_name => "Sensitivy"

  # Indirect associations

  # Validations

end
