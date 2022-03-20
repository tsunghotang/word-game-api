Rails.application.routes.draw do
  root to: 'words#home'
  get '/:word', to: 'words#query'
  get '/solve/:letters', to: 'words#solve'
end
