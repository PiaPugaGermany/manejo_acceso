Rails.application.routes.draw do

  get 'dashboards/index'
  get 'edit_user/:id', to: 'dashboards#edit_user', as: 'edit_user'
  delete 'delete_user/:id', to: 'dashboards#delete_user', as: 'delete_user'

  resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
