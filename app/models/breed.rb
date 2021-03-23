class Breed < ApplicationRecord
  has_many :pups, :parents
end
