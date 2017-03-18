class CreateScouts < ActiveRecord::Migration[5.0]
  def change
    create_table :scouts do |t|
      t.string :first_name, :last_name
      t.string :email
      t.boolean :is_admin
      t.integer :slot
      t.string :nickname
      t.boolean :is_active
    end
    
    change_column_default :scouts, :is_active, true
  end
end
