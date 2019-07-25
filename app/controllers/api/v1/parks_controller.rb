class Api::V1::ParksController < ApplicationController
  def index
    render json: {
    parks: ActiveModel::Serializer::CollectionSerializer.new(Park.all, each_serializer: ParkSerializer),
    reviews: ActiveModel::Serializer::CollectionSerializer.new(Review.all, each_serializer: ReviewSerializer)
    }
  end

  def show
   park = Park.find(params[:id])
   render json: park
  end

  # def update
  #   park = Park.find(params[:park_id])
  #   review= Review.find(params[:review_id])
  #
  #   vote = Vote.new(vote_params)
  #   if vote.save
  #     flash[:success] = "Vote added successfully"
  #     redirect_to @park
  #   else
  #     flash.now[:error] = vote.errors.full_messages.join(",")
  #   end
  # end
  #
  # def vote_params
  #   params.requre(:vote).permit(:user_id, :review_id, :vote_type)
  # end
  #
  # def vote_params
  #   params.requre(:vote).permit(:user_id, :review_id, :vote_type)
  # end
end
