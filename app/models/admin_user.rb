class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      current_sign_in_at
      last_sign_in_at
      current_sign_in_ip
      last_sign_in_ip
      sign_in_count
      remember_created_at
      created_at
      updated_at
    ]
  end
end
