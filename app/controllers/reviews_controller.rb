class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @park = Park.find(params[:park_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id if current_user
    @park = Park.find(params[:park_id])
    @review.user_id = current_user.id if current_user
    @review.park = @park
      if @review.save
        flash[:success] = "Review add successfully"
        redirect_to @park
      else
        flash[:error] = @review.errors.full_messages.join(", ")
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
