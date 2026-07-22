class ClinicMembership < ApplicationRecord
  belongs_to :clinic
  belongs_to :user
  belongs_to :role
end
