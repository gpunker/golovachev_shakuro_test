# frozen_string_literal: true

# Without swagger, sorry. I commented some routes that must be explained.
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/publishers' do
      get '/', to: 'publishers#index', as: 'publishers_index'
      get '/:slug', to: 'publishers#show', as: 'publishers_show'
    end

    scope '/shops' do
      # url: "/shops/1/order", json_body: { book_id: 1, amount: 1 }
      post '/:id/order', to: 'shops#order', as: 'shops_order'
    end
  end
end
