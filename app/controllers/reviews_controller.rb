class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @park = Park.find(params[:park_id])
    @review = Review.new
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
      errors = @review.errors.full_messages
      index = errors.index("Rating is not included in the list")
        if (index != nil)
          errors[index] = "Rating must be a number of 1-5"
          errors[index+1] = "Review can't be blank"
        end
      flash.now[:error] = errors.join("<br/>").html_safe
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
            errors[index+1] = "Review can't be blank"
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
