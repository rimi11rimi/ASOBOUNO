Rails.application.routes.draw do
  get 'plays/gohan' => 'plays#gohan'
  get 'plays/moll' => 'plays#moll'
  get 'plays/sport' => 'plays#sport'
  get 'plays/activity' => 'plays#activity'
  get 'plays/view' => 'plays#view'
  get 'plays/sizenn' => 'plays#sizenn'
  get 'plays/top' => 'plays#top'
  get 'plays/all' => 'plays#all'


  resources :plays
  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  resources :plays do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]

  end

  resources :perfumes

  root 'plays#all'
end
