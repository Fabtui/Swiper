class MatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @offer = Offer.find(params[:offer_id])
    if params[:like] && params[:like] === "true"
      create_match(@offer, true)
      @offer.like = true
    elsif params[:like] && params[:like] === "false"
      create_match(@offer, false)
      @offer.like = false
    end
    @offer.save
  end

  def destroy_all
    Match.destroy_all
    redirect_to root_path
  end


  private

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
