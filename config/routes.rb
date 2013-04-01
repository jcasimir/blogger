Blogger::Application.routes.draw do

  match "/login", :to => "logins#new"

  resource :login, :except => [:new]

  get "tags/index"

  get "tags/show"

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags

end
