Rails.application.routes.draw do
  resources :todos
  resources :projects

  # resources :projects do
  #   resources :todos
  # end
  # patch '/projects/:project_id/todos/:id' 'todos#update'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
