class UserSensitivy < ApplicationRecord
  # Direct associations

  has_many   :cookbooks,
             :foreign_key => "user_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  belongs_to :sensitivity,
             :class_name => "Sensitivy"

  # Indirect associations

  # Validations

end
