class Report < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :scout
  
  def auto_fuel_shots
    auto_fuel_top_hit + auto_fuel_top_miss
  end
  
  def auto_fuel_top_accuracy
    auto_fuel_top_hit.to_f / auto_fuel_shots.to_f
  end
  
  def teleop_fuel_shots
    teleop_fuel_top_hit + teleop_fuel_top_miss
  end
  
  def teleop_fuel_top_accuracy
    teleop_fuel_top_hit.to_f / teleop_fuel_shots.to_f
  end
  
end