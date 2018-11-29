class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, inclusion: { in: 1..5, message: 'The rating must be between 1 and 5' }
end
