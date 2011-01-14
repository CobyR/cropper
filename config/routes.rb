Resizer::Application.routes.draw do
  get "main/index"

  resources :pictures do
    member do
      get 'crop'
    end
  end

  root :to => "main#index"

end
