VolunteerScheduler::Application.routes.draw do
  match 'appointments/availability' => 'appointments#availability', :as => :appointments_availability

  resources :user, :controller => "users"
  devise_for :users
  
  match 'events/old', to: 'events#old', as: :old

  resources :events do

    match 'create_rotation', to: 'rotations#create_rotation', via: [:get]
    match 'create_reminder', to: 'events#create_reminder'
    
    resources :rotations do

      resources :shifts do
        match 'notify', to: 'shifts#notify', as: 'notify', via: [:get]
      end

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
