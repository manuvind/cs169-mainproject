VolunteerScheduler::Application.routes.draw do
  resources :events do
    member do
      get    'shifts'               , to: 'shifts#index'  , as: :shift
      get    'shifts/new'           , to: 'shifts#new'    , as: :new_shift
      post   'shifts'               , to: 'shifts#create' , as: :create_shift
      get    'shifts/:shift_id/edit', to: 'shifts#edit'   , as: :edit_shift
      put    'shifts/:shift_id'     , to: 'shifts#update' , as: :update_shift
      delete 'shifts/:shift_id'     , to: 'shifts#destroy', as: :destroy_shift
    end
  end

  root to: 'static_pages#home'

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # See how all your routes lay out with "rake routes"
end