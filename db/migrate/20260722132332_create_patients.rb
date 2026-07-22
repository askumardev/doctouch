class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_of_birth
      t.string :gender
      t.string :blood_group
      t.string :phone
      t.string :emergency_contact

      t.timestamps
    end
  end
end
