class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :major

  has_one :aim_license_container
  has_one :like_license_container
  has_one :got_license_container

  has_many :anony_posts
  has_many :anony_comments
  has_many :book_posts
  has_many :book_comments
  
end
