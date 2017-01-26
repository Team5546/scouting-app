class Team < ApplicationRecord
  validates :name, presence: true
  validates :number, presence: true, numericality: { message: 'is not valid' }, uniqueness: true
  mount_uploader :top_picture, PictureUploader
  mount_uploader :side_picture, PictureUploader
  mount_uploader :front_picture, PictureUploader
end
