Bicicletea::Application.routes.draw do


  
  
  root 'welcome#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:index, :show]
  resources :projects, only: [:index, :show]

  #resources :categories, only: [:index, :show] do
      #resources :products, only: [:index, :show]
  #  end

  resources :posts, only: [:index, :show]
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]


  #match 'posts/by_year_and_month/:year/:month' => 'posts#by_year_and_month', :as=> :posts_by_year_and_month,  via: 'get'

  devise_for :editors, controllers: { sessions: "editors/sessions", passwords: "editors/passwords" }
  devise_for :super_admins, :module => 'super_admin', path: "super_admin", controllers: { sessions: "super_admin/sessions", passwords: "super_admin/passwords" }

  namespace :editors do
    resources :dashboard, only: [:index]
  end

  namespace :super_admin do
    resources :dashboard, only: [:index]
    resources :posts
    resources :categories
    resources :subcategories
    resources :products
    resources :project_types
    resources :projects
    resources :webimages
  end
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
