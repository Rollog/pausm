Pausm::Application.routes.draw do
  get "pages/home"
  get "pages/daws"
  get "pages/genres"

  root to: 'welcome#index'
  
  # get 'questions' => 'questions#index'
  # get 'questions/new' => 'questions#new' # shows form to add new types, must come before show
  # get 'questions/:id' => 'questions#show'

  # get 'questions/edit/:id' => 'questions#edit'

  # post 'questions' => 'questions#create' # creating a new type
  # delete 'questions/:id' => 'questions#destroy'

  # nested routing
  resources :users do
    resources :questions
  end

  post 'questions/:id/edit' => 'questions#update'

  resources :questions do
    resources :answers, :tags
  end

  get 'upvote' => 'questions#upvote'
  get 'downvote' => 'questions#downvote'
  

  resources :authentications

  

  resources :pages
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'authentications#new',  via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

    

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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