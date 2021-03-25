class Breed < ApplicationRecord
  has_many :pups
  has_many :parents
end
