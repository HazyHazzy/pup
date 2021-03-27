class Puppy < ApplicationRecord
  belongs_to :breed
  belongs_to :litter
end
