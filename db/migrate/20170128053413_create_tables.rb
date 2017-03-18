class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :number
    end
    
    create_table :alliances do |t|
      t.references :match, index: true
      t.references :team1, :team2, :team3, index: true
      t.string :color
      t.integer :score
      t.integer :total_rotors
      t.integer :ranking_points
    end
    
    create_table :alliance_members do |t|
      t.references :team, :alliance, index: true
    end

    create_table :reports do |t|
      t.references :team, :match, index: true
      t.references :scout, index: true
      
      # Autonomous
      t.boolean :auto_moved
      t.integer :auto_fuel_speed, precision: 3, scale: 2
      t.integer :auto_fuel_accuracy, precision: 3, scale: 2
      t.boolean :auto_fuel_bottom
      t.integer :auto_gears_collected
      t.integer :auto_gears_delivered
      t.boolean :auto_rotors
      t.boolean :auto_goal_line
      t.boolean :auto_flipped
      
      # Teleop
      t.integer :teleop_fuel_speed, precision: 3, scale: 2
      t.integer :teleop_fuel_accuracy, precision: 3, scale: 2
      t.decimal :teleop_fuel_bottom, precision: 3, scale: 2
      t.integer :teleop_gears_collected
      t.integer :teleop_gears_delivered
      t.boolean :teleop_gears_off_the_ground
      
      # Final
      t.boolean :climb
      t.boolean :flipped
      t.boolean :broken
      t.text :comments # Need to add to form
    end
    
    create_table :weights do |t|
      t.string :name
      t.integer :weight
    end
  end
end