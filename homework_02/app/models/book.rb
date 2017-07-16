class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
  belongs_to :user
end
