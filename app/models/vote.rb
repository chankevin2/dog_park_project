class Vote <ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates: user_id, presence: true
  validates: review_id, presence: true
  validates: vote_type, presence: true, inclusion: {in: ['thumbs_up', 'thumbs_down']}
end
