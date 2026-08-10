ActiveAdmin.register Branch do
  permit_params :clinic_id,
                :name,
                :address,
                :email,
                :phone,
                :registration_number,
                :status,
                :subscription_plan

  index do
    selectable_column
    id_column
    column :clinic
    column :name
    column :email
    column :phone
    column :registration_number
    column :status
    column :subscription_plan
    actions
  end

  filter :clinic
  filter :name
  filter :email
  filter :phone
  filter :registration_number
  filter :status, as: :select, collection: proc { Branch.distinct.pluck(:status).compact }
  filter :subscription_plan, as: :select, collection: proc { Branch.distinct.pluck(:subscription_plan).compact }

  show do
    attributes_table do
      row :id
      row :clinic
      row :name
      row :email
      row :phone
      row :registration_number
      row :status
      row :subscription_plan
      row :address
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Branch Details" do
      f.input :clinic
      f.input :name
      f.input :email
      f.input :phone
      f.input :registration_number
      f.input :status
      f.input :subscription_plan
      f.input :address
    end
    f.actions
  end
end
