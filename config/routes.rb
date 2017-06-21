Rails.application.routes.draw do
  root to: 'members#index'

  resources :members
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'
                                  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
end
