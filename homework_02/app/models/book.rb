class Book < ApplicationRecord

  paginates_per  5

  has_many :authorships
  has_many :authors, through: :authorships
  belongs_to :user
end
