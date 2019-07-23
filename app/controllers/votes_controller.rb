class VotesController <ApplicationController
  def update
    vote = Vote.new(vote_params)
    if vote.save
      flash[:success] = "Vote added successfully"
      redirect_to @park
    else
      flash.now[:error] = vote.errors.full_messages.join(",")
    end
  end

  def vote_params
    params.requre(:vote).permit(:user_id, :review_id, :vote_type)
  end
end
