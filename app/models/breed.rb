class Breed < ApplicationRecord
  has_many :pups, :parents, :breed_breeders
end
