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
      create_match(@offer, true)
      @offer.like = true
    elsif params[:like] && params[:like] === "false"
      create_match(@offer, false)
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

  def create_match(offer, like)
    if Match.find_by_offer_id(offer.id).present?
      @match = Match.find_by_offer_id(offer.id)
      @match.user_status = like
    else
      @match = Match.new(user_status: like, offer_id: offer.id)
    end
    @match.save
  end
end
