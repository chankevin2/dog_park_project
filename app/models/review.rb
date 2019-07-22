class Review < ApplicationRecord
  validates :rating, presence: true, inclusion: { in: [1,2,3,4,5] }
  validates :body, presence: true
  validates :park_id, presence: true
  validates :user_id, presence: true

  belongs_to :park
  belongs_to :user
end
