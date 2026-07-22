class User < ApplicationRecord
  has_secure_password

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  has_many :clinic_memberships, dependent: :destroy
  has_many :clinics, through: :clinic_memberships

  validates :email, presence: true, uniqueness: true
end
