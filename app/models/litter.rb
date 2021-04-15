class Litter < ApplicationRecord
  belongs_to :breeder
  belongs_to :stud, :class_name => "Parent"
  belongs_to :mom, :class_name => "Parent"
  has_many :puppies, dependent: :destroy
  has_one_attached :photo
end
