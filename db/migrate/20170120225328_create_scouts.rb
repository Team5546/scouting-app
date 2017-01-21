class CreateScouts < ActiveRecord::Migration[5.0]
  def change
    create_table :scouts do |t|
      t.string :first_name, :last_name
      t.string :email
    end
  end
end
