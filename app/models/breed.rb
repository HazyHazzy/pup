class Breed < ApplicationRecord
  has_many :puppies
  has_many :parents
  has_many :breed_breeders
  has_many :breeders, through: :parents
  has_one_attached :photo
end
