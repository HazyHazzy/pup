class Breed < ApplicationRecord
  has_many :puppies
  has_many :parents
  has_one_attached :photo
end
