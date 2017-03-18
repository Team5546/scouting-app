class Team < ApplicationRecord
  has_many :alliance_members
  has_many :alliances, through: :alliance_members
  has_many :matches, through: :alliances
  has_many :reports
  
  scope :ordered, -> { order(:number) }
  
  validates :name, presence: true
  validates :number, presence: true, numericality: { message: 'is not valid' }, uniqueness: true
  mount_uploader :top_picture, PictureUploader
  mount_uploader :side_picture, PictureUploader
  mount_uploader :front_picture, PictureUploader
  
  def score
    @score ||= reports.map do |report|
      (report.auto_moved).to_i +
      (report.auto_fuel_speed).to_i +
      (report.auto_fuel_accuracy).to_i +
      (report.auto_fuel_bottom).to_i +
      (report.auto_gears_collected).to_i +
      (report.auto_gears_delivered).to_i +
      (report.auto_goal_line).to_i +
      (report.teleop_fuel_speed).to_i +
      (report.teleop_fuel_accuracy).to_i +
      (report.teleop_fuel_bottom).to_i + 
      (report.teleop_gears_collected).to_i +
      (report.teleop_gears_delivered).to_i +
      (report.teleop_gears_off_the_ground).to_i +
      ((report.auto_flipped).to_i) * -1+
      ((report.flipped).to_i)*-1 +
      ((report.broken).to_i)* -1 +
      (report.climb).to_i
    end.inject(&:+) || 0
  end
end