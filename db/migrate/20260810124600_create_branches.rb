class CreateBranches < ActiveRecord::Migration[8.1]
  def change
    create_table :branches do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.string :registration_number
      t.string :status
      t.string :subscription_plan

      t.timestamps
    end
  end
end
