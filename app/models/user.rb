class User < ActiveRecord::Base
  has_many :comments
  has_many :opinions
  # has_many :dgitals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
