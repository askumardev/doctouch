class CreateReceptionists < ActiveRecord::Migration[8.1]
  def change
    create_table :receptionists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :employee_code

      t.timestamps
    end
  end
end
