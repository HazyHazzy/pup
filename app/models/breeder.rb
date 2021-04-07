class Breeder < ApplicationRecord
  has_many :litters
  has_many :puppies, through: :litters
  has_many :parents
  has_many :visitations
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :city, presence: true
  validates :about_us, presence: true
end
