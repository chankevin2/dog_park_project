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
    @park = Park.find(params[:park_id])
    @review.user_id = current_user.id if current_user
    @review.park = @park
      if @review.save
        flash[:success] = "Review added successfully"
        redirect_to @park
      else
        errors = @review.errors.full_messages
        index = errors.index("Rating is not included in the list")
          if (index != nil)
            errors[index] = "Rating must be a number of 0-5"
          end
        flash.now[:error] = errors.join("<br/>").html_safe
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
