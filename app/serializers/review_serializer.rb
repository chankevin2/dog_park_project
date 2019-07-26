class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :park_id, :user_id, :user_email
  belongs_to :park
  belongs_to :user

  def user_email
    object.user.email
  end
end
