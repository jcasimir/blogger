Blogger::Application.routes.draw do

  get "/login", :to => "logins#new"
  get "/logout", :to => "logins#destroy"

  resource :login, :except => [:new]

  get "tags/index"

  get "tags/show"

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags

end
