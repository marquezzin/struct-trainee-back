Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    scope 'users' do
      post 'create', to: 'users#create'
      get 'index', to: 'users#index'
      get 'show/:id', to: 'users#show'
      patch 'update/:id', to: 'users#update'
      delete 'delete/:id', to: 'users#delete'
      get 'login', to: 'users#login'
    end
    
    scope 'categories' do
      post 'create', to: 'categories#create'
      get 'index', to: 'categories#index'
      get 'show/:id', to: 'categories#show'
      patch 'update/:id', to: 'categories#update'
      delete 'delete/:id', to: 'categories#delete'
    end
    
    scope 'posts' do
      post 'create', to: 'posts#create'
      get 'index', to: 'posts#index'
      get 'show/:id', to: 'posts#show'
      patch 'update/:id', to: 'posts#update'
      delete 'delete/:id', to: 'posts#delete'
    end
    
    scope 'upvotes' do
      post 'create', to: 'upvotes#create'
      get 'index', to: 'upvotes#index'
      get 'show/:id', to: 'upvotes#show'
      patch 'update/:id', to: 'upvotes#update'
      delete 'delete/:id', to: 'upvotes#delete'
    end
    
    scope 'comments' do
      post 'create', to: 'comments#create'
      get 'index', to: 'comments#index'
      get 'show/:id', to: 'comments#show'
      patch 'update/:id', to: 'comments#update'
      delete 'delete/:id', to: 'comments#delete'
    end
    
    scope 'post_categories' do
      post 'create', to: 'post_categories#create'
      get 'index', to: 'post_categories#index'
      get 'show/:id', to: 'post_categories#show'
      patch 'update/:id', to: 'post_categories#update'
      delete 'delete/:id', to: 'post_categories#delete'
    end
  end
end
