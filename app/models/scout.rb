class Scout < ApplicationRecord
  include Canable::Cans
  include Canable::Ables
  has_many :reports
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def name
    [first_name, nickname.present? ? "\"#{nickname}\"" : nil, last_name].join(' ')
  end

  enum slot: [:r1, :r2, :r3, :b1, :b2, :b3]

  def self.is_assigned?(slot)
    find_by(slot: slot)
  end

  def self.is_admin?(slot)
    find_by(slot: slot)
  end

  def self.viewable_by?(user)
    user.is_admin?
  end

  def find_team_for_match(match)
    return nil if slot.nil?

    color, number = slot.match(/([rb])([1-4])/).to_a.slice(1, 2)
    number = number.to_i - 1
    color = { "r" => "red", "b" => "blue" }[color]

    match.alliances.find_by(color: color).members[number].team
  end
end
