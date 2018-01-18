Rails.application.routes.draw do
  resources :users
  mount Skooter::Engine => '/skooter'
end
