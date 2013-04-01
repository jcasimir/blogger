Blogger::Application.routes.draw do

  get "tags/index"

  get "tags/show"

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags

end
