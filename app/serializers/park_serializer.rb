class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name,:address, :city, :state, :zip, :description, :reviews

  has_many :reviews
end
