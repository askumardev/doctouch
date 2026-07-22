class CreateClinics < ActiveRecord::Migration[8.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :registration_number
      t.text :address
      t.string :phone
      t.string :email
      t.string :subscription_plan
      t.string :status

      t.timestamps
    end
  end
end
