class ImagesController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])

    if params[:images]
      params[:images].each do |img|
        @listing.images.create(image: img)
      end

      @images = @listing.images
      redirect_back(fallback_location: request.referer, notice: 'Images added successfully')
    end
  end

  def destroy
    @images = Image.find(params[:id])

    if @images.destroy
      redirect_back(fallback_location: request.referer, alert: "Image deleted...")
    end
  end
end