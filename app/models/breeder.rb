class Breeder < ApplicationRecord
  has_many :litters, :parents, :visitations, :breed_breeders
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :city, presence: true
  validates :about_us, presence: true
end
