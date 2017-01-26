class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number
      t.boolean :high_fuel, :low_fuel, :get_gear, :deliver_gear, :climb_rope
      t.text :comments
      t.string :top_picture, :side_picture, :front_picture
    end
  end
end
