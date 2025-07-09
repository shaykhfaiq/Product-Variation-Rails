Rails.application.routes.draw do
  
  get 'products/filter', to: 'products#filter', as: :filter_products

  resources :products do
    resources :variants, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :product_option_types, only: [:create, :destroy]
    get 'option_values', to: 'products#option_values'
  end

  resources :option_types do
    resources :option_values, only: [:index, :create, :destroy]
  end
end
