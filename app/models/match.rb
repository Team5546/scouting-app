class Match < ApplicationRecord
  has_many :alliances, inverse_of: :match
  has_many :reports
  accepts_nested_attributes_for :alliances
  # validates_associated :alliances
  validates :number, presence: true, uniqueness: true
  
  # validates :alliances, length: { is: 2 }
  
  def self.viewable_by?(user)
    user.is_admin?
  end
end