class Branch < ApplicationRecord
  belongs_to :clinic

  def self.ransackable_attributes(auth_object = nil)
    %w[
      address
      clinic_id
      created_at
      email
      id
      name
      phone
      registration_number
      status
      subscription_plan
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[clinic]
  end
end
