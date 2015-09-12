class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :mail, null: false

      t.timestamps null: false
    end
  end
end
