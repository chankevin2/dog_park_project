class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :park_id

  belongs_to :park
end
