Rails.application.routes.draw do

  get 'test/index'
  get 'test/show'
  resource :redis, only: %i[:show]
end
