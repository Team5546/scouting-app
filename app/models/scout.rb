class Scout < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    [first_name, nickname.present? ? "\"#{nickname}\"" : nil, last_name].join(' ')
  end
end
