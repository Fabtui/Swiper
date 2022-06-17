class PagesController < ApplicationController
  def home
    @offers = Offer.all.sort_by(&:id)
  end
end
