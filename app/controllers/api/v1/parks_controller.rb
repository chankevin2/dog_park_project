class Api::V1::ParksController < ApplicationController
  def index
    render json: {
    parks: ActiveModel::Serializer::CollectionSerializer.new(Park.all, each_serializer: ParkSerializer),
    reviews: ActiveModel::Serializer::CollectionSerializer.new(Review.all, each_serializer: ReviewSerializer)
    }
  end

 def show
   render json: Park.find(params[:id])
 end
end
