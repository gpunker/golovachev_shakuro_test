# frozen_string_literal: true

# Controller of publishers class
class PublishersController < ApplicationController
  # List of publishers. Just for play with other actions
  def index
    @publishers = Publisher.all
    render :index
  end

  # Show shops which sells at least one book of specific publisher
  def show
    @shops = ShopService.get_shops_with_books_by_publisher(params[:slug])
    @shop_keys = @shops.keys
    render 'publishers/show'
  end
end
