class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @park = Park.find(params[:park_id])
  end

  def create
    @review = Review.new(review_params)
    @park = Park.find(params[:park_id])
    @review.park = @park
    if @review.save
      flash[:notice] = "Review add successfully"
      redirect_to @park
    else
      flash[:notice] = @review.error.full_messages.join(", ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
