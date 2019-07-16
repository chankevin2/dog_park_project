class ParksController < ApplicationController

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
      flash.new[:error] = @park.errors.full_messages.join(", ")
      render :new
    end
  end

  private
    def park_params
      params.require(:park).permit(:name, :address, :city, :state, :zip, :description)
    end
end
