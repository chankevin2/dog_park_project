class ReviewsController < ApplicationController
  before_actiob :find_review, only: [:new, :show. :edit, :update, :destroy]
  def index
    @reviews = Review.all.order("created_at DESC")
  end
  def show
  end
  def new
    @review = Review.new
  end
  def edit
  end
  def update
    if @review.update(review_params)
      redirect_to @park
    else 
      render 'edit'
  end
  def destroy
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
            errors[index] = "Rating must be a number of 1-5"
          end
        flash.now[:error] = errors.join("<br/>").html_safe
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def find_review
    @review = Review.find(params[:park_id])
  end
end
