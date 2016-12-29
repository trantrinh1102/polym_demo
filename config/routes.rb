# Rails.application.routes.draw do
#   get 'comments/index'

#   get 'comments/new'

#   resources :photos
#   resources :events
#   resources :articles

#   root to: 'articles#index'
# end
Rails.application.routes.draw do
  resources :photos do
    resources :comments
  end

  resources :events do
    resources :comments
  end

  resources :articles do
    resources :comments
  end

  root to: 'articles#index'
end
