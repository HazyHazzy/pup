class Breeder < ApplicationRecord
  has_many :litters
  has_many :puppies, through: :litters
  has_many :parents
  has_many :visitations
  has_many :breed_breeders
  has_many :breeds, through: :parents
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :city, presence: true
  validates :about_us, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_name_and_breed, against: :name, associated_against: {
    breeds: :name
  },
  using: {
    tsearch: { prefix: true }
  }
end
