class Puppy < ApplicationRecord
  belongs_to :breed
  belongs_to :litter
  has_one_attached :photo
end
