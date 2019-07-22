class Api::V1::ReviewsController < ApplicationController
def index
  render json: Review.all
end

def new
  @park = Park.find(params[:park_id])
  render json: Review.new
end

def create
  @review = Review.new(review_params)
  @park = Park.find(params[:park_id])
  @review.park = @park
end

private

def review_params
  params.require(:review).permit(:rating, :body)
end
end
