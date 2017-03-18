class AllianceMember < ApplicationRecord
  belongs_to :alliance, inverse_of: :members
  belongs_to :team
  
  # validates :team, uniqueness: { scope: :alliance_id }
end