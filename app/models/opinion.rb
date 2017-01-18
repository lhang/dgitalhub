class Opinion < ActiveRecord::Base
  has_many :child_opinions, class_name: "Opinion",
                           foreign_key: "parent_opinion_id"

  belongs_to :parent_opinion, class_name: "Opinion"
  belongs_to :user

  validates :contact, length: { minimum: 5 }
  validates :name, presence: true
  validates :name, uniqueness: true
end
