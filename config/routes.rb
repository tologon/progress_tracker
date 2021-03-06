Rails.application.routes.draw do
  devise_for :students
  root 'home#index'

  # Data fetch sample pages (not for actual use, just demonstration purposes)
  get 'flow',           to: 'data_fetch#flow'
  get 'core',           to: 'data_fetch#core'
  get 'exams',          to: 'data_fetch#exams'
  get 'grades',         to: 'data_fetch#grades'
  get 'content',        to: 'data_fetch#content'
  get 'announcements',  to: 'data_fetch#announcements'
  get 'schedules',      to: 'data_fetch#schedules'
  get 'course_info',    to: 'data_fetch#course_info'
  get 'terms',          to: 'data_fetch#terms'
  get 'users',          to: 'data_fetch#users'

  # Sign-in page (probably will need re-work later)
  get 'sign_in',        to: 'home#sign_in'

  # Course-related pages
  get 'courses',        to: 'courses#index'
  get 'courses/:id',    to: 'courses#course'
  get 'courses',        to: 'devise/courses#index'
  get 'courses/:id',    to: 'devise/courses#course'

  # Progress page
  get 'progress',       to: 'home#progress'

  # Settings page
  get   'settings',     to: 'home#settings'
  post  'settings',     to: 'home#update'

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
