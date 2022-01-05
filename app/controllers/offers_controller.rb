class OffersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @offers = Offer.all.sort_by(&:id)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if params[:like] && params[:like] === "true"
      @offer.like = true
    elsif params[:like] && params[:like] === "false"
      @offer.like = false
    end
    @offer.save
    respond_to do |format|
      format.html
      format.js #this is needed to handle ajaxified pagination
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :like)
  end
end
