Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :blogs do
    resources :posts do
      resources :comments
    end
  end

  root to: 'welcome#index'

end
