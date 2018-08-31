Rails.application.routes.draw do
  resources :news
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
  resources :categories

  resources :products do
  	get :who_bought, on: :member
	end

  post 'reduce_qty' => 'line_items#reduce_qty'
  post 'reduce_stock' => 'orders#reduce_stock'
  get 'contact' => 'store#contact'
  get 'question' => 'store#question'
  get 'news_user' => 'store#news_user'
  get 'show_news' => 'store#show_news'


  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
