class FixSlotType < ActiveRecord::Migration[5.0]
  def change
    change_column :scouts, :slot, :string
  end
end
