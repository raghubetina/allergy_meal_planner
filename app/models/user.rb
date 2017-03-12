class User < ApplicationRecord
  # Direct associations

  has_many   :user_sensitivies,
             :dependent => :destroy

  # Indirect associations

  has_many   :sensitivities,
             :through => :user_sensitivies,
             :source => :sensitivity

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
