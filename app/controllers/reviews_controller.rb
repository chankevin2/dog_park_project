class ReviewsController < ApplicationController
  before_action :find_review, only: [:new, :edit, :update, :destroy]
  def index
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @review = Review.new
    @park = Park.find(params[:park_id])
  end

  def edit
    @park = Park.find(params[:park_id])
    @review = Review.find(params[:id])
  end

  def update
    @park = Park.find(params[:park_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "Review edited successfully"
      redirect_to park_path(@park)
    else
      flash.now[:error] = @review.errors.full_messages.join("<br/>").html_safe
      render :edit
    end
  end

  def destroy
    @park = Park.find(params[:park_id])
    @review = Review.find(params[:id])

    @review.destroy
    flash[:success] = "Review deleted successfully"
    redirect_to park_path(@park)
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
