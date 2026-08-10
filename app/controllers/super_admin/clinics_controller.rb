module SuperAdmin
  class ClinicsController < ApplicationController
    before_action :require_super_admin
    before_action :set_clinic, only: %i[show edit update destroy]

    def index
      @clinics = Clinic.all.order(:name)
    end

    def show
    end

    def new
      @clinic = Clinic.new
    end

    def create
      @clinic = Clinic.new(clinic_params)

      if @clinic.save
        redirect_to super_admin_clinic_path(@clinic), notice: "Clinic created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @clinic.update(clinic_params)
        redirect_to super_admin_clinic_path(@clinic), notice: "Clinic updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @clinic.destroy
      redirect_to super_admin_root_path, notice: "Clinic deleted successfully."
    end

    private

    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def clinic_params
      params.require(:clinic).permit(:name, :email, :phone, :address, :registration_number, :status, :subscription_plan)
    end
  end
end
