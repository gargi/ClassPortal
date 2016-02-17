Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  Rails.application.routes.draw do
  resources :admins do
    collection do
      get :index_admin
      get :index_course
      get :index_instructor
      get :index_student
      get :new_admin
      get :new_course
      get :new_instructor
      get :new_student
      get :show_admin
      get :show_course
      get :show_instructor
      get :show_student
      get :edit_admin
      get :edit_course
      get :edit_instructor
      get :edit_student
      post :create_admin
      post :create_course
      post :create_instructor
      post :create_student
      get :destroy_admin
      get :destroy_course
      get :destroy_instructor
      get :destroy_student
      get :update_admin
      get :update_course
      get :update_instructor
      get :update_student
    end
  end
  resources :courses
  resources :students
  resources :instructors
  root 'home#index'
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
