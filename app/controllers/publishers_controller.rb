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
    @shops = Shop.select(:'shops.id', :'shops.name', :'books.id', :'books.title', :'stores.amount').
                  joins(stores: [{ book: :publisher }]).
                  where('publishers.slug' => params[:slug]).distinct
    render 'publishers/show'
  end
end
