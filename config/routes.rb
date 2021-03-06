Rails.application.routes.draw do
  root 'static_pages#home'
  
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  patch  'update-basic-info',    to: 'users#update_basic_info'
  patch  'update-user-info/:id', to: 'users#update_user_info', as: :update_user_info
  get    'users/:id/attendances/:date/edit',       to: 'attendances#edit', as: :edit_attendances
  patch  'users/:id/attendances/:date/update',     to: 'attendances#update', as: :update_attendances
  get    'users/:id/attendances/:date/create_csv', to: 'attendances#create_csv', as: :create_csv_attendances
  post   'users/:id/attendances/:date/create_approval_status', to: 'attendances#create_approval_status', as: :create_approval_status
  patch  'users/:id/attendances/:date/update_approval_status', to: 'attendances#update_approval_status', as: :update_approval_status
  
  resources :users do
    collection { post :import_csv }
    collection { get :working_employee }
    resources :attendances, only: :create
  end
  
  resources :bases
end
