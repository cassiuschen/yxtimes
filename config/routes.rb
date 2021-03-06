Rails.application.routes.draw do

  resources :votes
  resources :focuses
  resources :articles
  resources :matches
  resources :works
  #get 'welcome/index'
  get 'about' => 'welcome#about'
  get 'people' => 'welcome#people'
  get 'events' => 'welcome#events'
  get 'surveys' => 'welcome#surveys'
  get 'views' => 'welcome#views'
  #get 'welcome/about'

  devise_for :users
  resources :articles do 
    get :avatar, on: :member
    resources :comments
  end
  # The priority is based upon order of creation: first created -> highest priority.

  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :admin do
    get '/' => "home#index"
    resources :articles  
    resources :users
    resources :focuses do 
      resources :articles, controller: :focuse_articles
    end
    resources :matches do 
      resources :reports
      resources :forecasts
      resources :articles, controller: :match_articles
    end
    resources :votes
  end

  scope module: :api, path: '/api', defaults: { format: 'json' } do
    namespace :v1 do
      post 'thumb', controller: '/api/common/upload', action: 'create'
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
