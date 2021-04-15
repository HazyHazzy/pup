class Parent < ApplicationRecord
  belongs_to :breed
  belongs_to :breeder
  has_many :litters, dependent: :destroy
  has_one_attached :photo
end
