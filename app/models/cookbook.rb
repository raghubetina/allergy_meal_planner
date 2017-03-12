class Cookbook < ApplicationRecord
  # Direct associations

  has_many   :cookbook_meals,
             :dependent => :destroy

  belongs_to :user,
             :class_name => "UserSensitivy"

  # Indirect associations

  # Validations

end
