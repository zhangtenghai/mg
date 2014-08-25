Rails.application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => {sessions: 'sessions',registrations: 'registrations'}

  resources :users, :only => [:show]
  namespace :admin do
    resources :articles do
      collection do
        get "previews"
        get "evaluations"
        get "voices"
      end
    end
    resources :adverts
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

  namespace :ajax do
    get "user_favorites/news/:id" => "user_favorites#news", :defaults => { :format => 'json' }
    get "user_favorites/game/:id" => "user_favorites#game", :defaults => { :format => 'json' }
    get "user_favorites/article/:id" => "user_favorites#article", :defaults => { :format => 'json' }
  end

  get "my" => "my#index"
  
  namespace :my do
    get "profile" => "profile#index"
    get "profile/edit"=> "profile#edit"
    post "profile/update" => "profile#update"
    get "scores" => "scores#index"
  end
  
  resources :games, only: [:index,:show,:update] do
    collection do
      get "expect"
      get "search"
    end
  end
  resources :news, only: [:index,:show,:update]
  resources :comments, only: [:destroy]
  resources :articles, only: [:show,:update] do
    collection do
      get "previews"
      get "evaluations"
      get "voices"
    end
  end

  resources :search, only: [:index]
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
