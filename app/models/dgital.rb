class Dgital < ActiveRecord::Base
  has_many :comments
  has_many :dgital_attachments
  mount_uploader :image, DgitalImageUploader

  validates :link, uniqueness: true
  validates :link, :publish_time, presence: true



  # belongs_to :user

end
