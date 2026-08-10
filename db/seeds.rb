roles = [
  "super_admin",
  "clinic_admin",
  "doctor",
  "receptionist",
  "patient"
]

roles.each do |role|
  Role.find_or_create_by!(name: role)
end

super_admin_role = Role.find_by!(name: "super_admin")

super_admin = User.find_or_create_by!(email: "admin@doctouch.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.status = "active"
end

UserRole.find_or_create_by!(user: super_admin, role: super_admin_role)

admin_user = AdminUser.find_or_create_by!(email: "admin@doctouch.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

sample_clinic = Clinic.find_or_create_by!(name: "Sample Clinic") do |clinic|
  clinic.email = "info@sampleclinic.com"
  clinic.phone = "555-0100"
  clinic.address = "123 Sample Street, Test City"
  clinic.registration_number = "SC-1001"
  clinic.status = "active"
  clinic.subscription_plan = "basic"
end

sample_clinic.branches.find_or_create_by!(name: "Main Branch") do |branch|
  branch.email = "main@sampleclinic.com"
  branch.phone = "555-0110"
  branch.address = "123 Sample Street, Test City"
  branch.registration_number = "SCB-1001"
  branch.status = "active"
  branch.subscription_plan = "basic"
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?