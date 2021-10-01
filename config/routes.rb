# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/publishers' do
      get '/', to: 'publishers#index', as: 'publishers_index'
      get '/:slug', to: 'publishers#show', as: 'publishers_show'
    end
  end
end
