class OffersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @offers = Offer.all.sort_by(&:id)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def update
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :like)
  end
end
