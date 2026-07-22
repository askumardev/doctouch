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


super_admin = User.find_or_create_by!(
  email: "admin@doctouch.com"
) do |user|
  user.password = "password"
  user.password_confirmation = "password"
end


UserRole.find_or_create_by!(
  user: super_admin,
  role: super_admin_role
)
