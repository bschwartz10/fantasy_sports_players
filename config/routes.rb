Rails.application.routes.draw do
  resources :welcome, only: [:index]
  namespace :api do
  namespace :v1 do
    namespace :sports do
      resources :basketball, only: [:index]
      resources :baseball, only: [:index]
      resources :football, only: [:index]
    end
    resources :players, only: [:show]
  end
end

end
