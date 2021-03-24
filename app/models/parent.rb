class Parent < ApplicationRecord
  belongs_to :breed
  belongs_to :breeder
  has_many :litters
end
