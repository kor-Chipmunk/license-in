class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :major

  has_one :aim_license_container
  has_one :like_license_container
  has_one :got_license_container

  has_many :communities
  has_many :community_comments
  has_many :books
  has_many :book_comments
  
end
