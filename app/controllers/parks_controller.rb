class ParksController < ApplicationController
  def index
    @parks = Park.all.order("created_at DESC")
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
      redirect_to park_path(@park)
    else
      render 'edit'
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to parks_path
  end

  private
    def park_params
      params.require(:park).permit(:name, :address, :city, :state, :zip, :description)
    end
end
