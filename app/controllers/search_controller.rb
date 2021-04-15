class SearchController < ApplicationController
  def search
    session[:address] = params[:search] if params.has_key?(:search)
    @search = Listing.where(is_active: true)
    @search = @search.where(address: session[:address])
    @search = @search.ransack(params[:q])
    @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end
end
