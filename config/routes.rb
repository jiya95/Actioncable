Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: 'registrations' }
	resources :sectors
	root 'sectors#index'
	mount ActionCable.server => '/cable'
	post "/association_user_sector" => "sectors#association_user_sector", :as => :create_forum


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
