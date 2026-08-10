class User < ApplicationRecord
  has_secure_password

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  has_many :clinic_memberships, dependent: :destroy
  has_many :clinics, through: :clinic_memberships

  validates :email, presence: true, uniqueness: true

  def has_role?(role_name)
    roles.exists?(name: role_name.to_s)
  end

  def super_admin?
    has_role?("super_admin")
  end
end
