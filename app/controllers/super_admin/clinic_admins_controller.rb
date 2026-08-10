module SuperAdmin
  class ClinicAdminsController < ApplicationController
    before_action :require_super_admin
    before_action :set_clinic

    def new
      @user = User.new
    end

    def create
      @user = User.new(clinic_admin_params)
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]

      if @user.save
        clinic_admin_role = Role.find_by!(name: "clinic_admin")
        UserRole.create!(user: @user, role: clinic_admin_role)
        ClinicMembership.create!(clinic: @clinic, user: @user, role: clinic_admin_role)

        redirect_to super_admin_clinic_path(@clinic), notice: "Clinic admin created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to super_admin_clinic_path(@clinic), notice: "Clinic admin deleted successfully."
    end

    private

    def set_clinic
      @clinic = Clinic.find(params[:clinic_id])
    end

    def clinic_admin_params
      params.require(:user).permit(:email, :status)
    end
  end
end
