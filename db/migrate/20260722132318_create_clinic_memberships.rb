class CreateClinicMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :clinic_memberships do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
