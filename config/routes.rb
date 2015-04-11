Rails.application.routes.draw do

  resources :followers

  devise_for :users, :controllers => {:registrations => 'update/registrations'}
  root 'desktop#index'

  mount Ckeditor::Engine => '/ckeditor'
  resources :projects do
    resources :pages
    resources :rewards do
      resources :contributions
      resources :addresses
    end
    resources :comments
  end

  get '/projects/:project_id/update', to: 'pages#viewupdates', as: 'projectsupdates'
  get '/project/:project_id', to: 'desktop#show', as: 'desktop_show_project'
  get '/project/:project_id/reward/:id', to: 'rewards#reward_selected', as: 'project_select_reward'
  post '/project/:project_id/reward/:reward_id/contributions/', to: 'contributions#continue_payment', as: 'continue_payment'
  get '/project/:project_id/reward/:reward_id/addresses', to: 'addresses#shipping_address', as: 'shipping_address'







  #este no me sirve pero lo dejo como ejemplo
  #get 'container', to: 'projects#containerpage', as: 'container'


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
