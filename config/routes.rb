VolunteerScheduler::Application.routes.draw do
  resources :user, :controller => "users"
  devise_for :users
  
  resources :events do
    resources :shifts do
      match 'notify', to: 'shifts#notify', as: 'notify', via: [:get]
    end
  end

  resources :volunteers

  root to: 'events#index'

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
