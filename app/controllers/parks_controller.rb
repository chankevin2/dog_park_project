class ParksController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @parks = Park.all
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)

    if @park.save
      flash[:success] = "Dog Park saved successfully"
      redirect_to parks_url
    else
      flash.now[:error] = @park.errors.full_messages.join(", ")
      render :new
    end
  end

  private
  def park_params
      params.require(:park).permit(:name, :address, :city, :state, :zip, :description)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end
end
