class AddNicknameAndIsActiveToScouts < ActiveRecord::Migration[5.0]
  def change
    change_table :scouts do |t|
      t.string :nickname
      t.boolean :is_active
    end
  end
end
