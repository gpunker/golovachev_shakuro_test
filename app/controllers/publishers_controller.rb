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
    # @shops = Shop.select(:'shops.id', :'shops.name', :'books.id', :'books.title', :'stores.amount').
    #               joins(stores: [{ book: :publisher }]).
    #               where('publishers.slug' => params[:slug]).distinct
    @shops = Shop.connection.select_all("
      SELECT sh.id as shop_id, sh.name, sh.total_sold, b.id as book_id, b.title, st.amount
      FROM shops sh
      INNER JOIN stores st on sh.id = st.shop_id
      INNER JOIN books b on b.id = st.book_id
      INNER JOIN publishers p on p.id = b.publisher_id
      WHERE p.slug like '#{params[:slug]}'
      ORDER BY sh.total_sold DESC")
                 .to_a
                 .group_by { |i| i['name'] }
    @shop_keys = @shops.keys
    render 'publishers/show'
  end
end
