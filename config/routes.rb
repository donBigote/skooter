Skooter::Engine.routes.draw do


  resources :forms
  # Routes for submit and download forms viw ODK app
  resources :odk, defaults: { format: 'xml' }, only: [:index, :show]
  match '/submission', to: 'odk#submissions', via: :all, defaults: { format: 'xml' }

  # get '/formList', to: 'odk#index', defaults: { format: 'xml' }
  # get '/forms/:id', to: 'odk#show', defaults: { format: 'xml' }
  # match '/submission', to: 'odk#submissions', via: :all, defaults: { format: 'xml' }

end
