Rails.application.routes.draw do

  namespace :admin do
    resources :images
    resources :pages
    resources :sites

    get :statics  , to: 'pages#statics'   , as: :statics
    get :articles , to: 'pages#articles'  , as: :articles
    get :recipes  , to: 'pages#recipes'   , as: :recipes
    get :resources, to: 'pages#resources' , as: :resources

    root 'admin#root'
  end
 
  scope module: :public do

    resources :articles, path: 'articulos'
    resources :recipes, path: 'recetas'
    resources :resources, path: 'recursos' do
      get :download, on: :member
    end
    
    get :sitemap, to: 'public#sitemap', format: 'xml'
    get  :login , to: 'login#log_in' , as: :login
    post :logout, to: 'login#log_out', as: :logout
    post :submit, to: 'login#submit' , as: :submit

    root 'public#home'    
    get  ':id', to: 'pages#show', as: :static_page
  end

end