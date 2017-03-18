class Alliance < ApplicationRecord
  has_many :members, class_name: 'AllianceMember', inverse_of: :alliance
  has_many :teams, through: :members
  belongs_to :match, inverse_of: :alliances
  
  accepts_nested_attributes_for :members
  # validates :members, presence: true, length: { is: 3 }
  # validates_associated :members
  
  # validates :color, presence: true, uniqueness: { scope: :match_id }
end