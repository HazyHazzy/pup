class Breed < ApplicationRecord
  has_many :puppies
  has_many :parents
end
