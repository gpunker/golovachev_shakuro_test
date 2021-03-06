# frozen_string_literal: true

# class ShopsController
class ShopsController < ApplicationController
  # Creates a new order
  def order
    @shop, @book, @order = ShopService.make_order(params[:id].to_i, params[:book_id], params[:amount])
    render 'shops/order', status: :created
  rescue StandardError => e
    @message = e.message
    render 'shops/order_error', status: :bad_request
  end
end
