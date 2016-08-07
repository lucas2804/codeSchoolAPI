Rails.application.routes.draw do
  namespace :api do
    resources :crawlers
  end

end
