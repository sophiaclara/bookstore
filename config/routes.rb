Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  # scope"(:locale)", :locale => /en|id/ do
  controller :sessions do
	get 'login' => :new
	post 'login' => :create
	delete 'logout' => :destroy
	end
	
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  resources :products do
  	get :who_bought, on: :member
	end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
