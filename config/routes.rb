Rails.application.routes.draw do


  devise_for :users
  
  namespace :admin do
    resources :articles
    resources :news
    resources :games
    resources :comments
    resources :voices
    resources :users do
      collection do
        get "change_password"
        patch "update_password"
      end
    end

    get "home/index"
  end
  
  resources :games, only: [:index,:show]
  resources :news, only: [:index,:show]
  resources :articles, only: [:index,:show]
  get "previews" => 'previews#index'
  get "evaluations" => 'evaluations#index'
  get "comments" => 'comments#index'
  

  root 'home#index'
  get "home/index"
  get "admin" => "admin/home#index"

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
