# frozen_string_literal: true

# class ShopsController
class ShopsController < ApplicationController
  # Creates a new order
  def order
    begin
      @shop = Shop.lock.find(params[:id])
    rescue StandardError
      return render 'shops/not_found', status: :not_found
    end

    @book = @shop.books.where(id: params[:book_id]).first
    if @book
      @shop.transaction do
        @order = Order.new(shop: @shop, book: @book, amount: params[:amount])
        @store = Store.where(book_id: @book.id, shop_id: @shop.id).first.lock!
        @shop.total_sold += @order.amount
        @store.amount -= @order.amount

        return render 'shops/order_error', status: :bad_request unless @store.amount >= 0

        @order.save!
        @shop.save!
        @store.save!
      end

      return render 'shops/order'
    end

    render 'shops/not_found', status: :not_found
  end
end
