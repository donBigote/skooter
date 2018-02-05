Rails.application.routes.draw do
  mount Skooter::Engine => '/skooter'
  resources :users
end
