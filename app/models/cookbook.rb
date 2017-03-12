class Cookbook < ApplicationRecord
  # Direct associations

  has_many   :cookbook_meals,
             :dependent => :destroy

  belongs_to :user,
             :class_name => "UserSensitivy"

  # Indirect associations

  has_many   :meals,
             :through => :cookbook_meals,
             :source => :meal

  # Validations

end
