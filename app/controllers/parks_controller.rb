class ParksController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @parks = Park.all.order("created_at DESC")
    # binding.pry
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
      flash.now[:error] = @park.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])

    if @park.update(park_params)
      flash[:success] = "Dog Park edited successfully"
      redirect_to park_path(@park)
    else
      flash.now[:error] = @park.errors.full_messages.join("<br/>").html_safe
      render :edit
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    flash[:success] = "Dog Park deleted successfully"
    redirect_to parks_path
  end

  private
  def park_params
      params.require(:park).permit(:name, :address, :city, :state, :zip, :description, :park_photo)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end
end
