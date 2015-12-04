Rails.application.routes.draw do
  use_doorkeeper scope: ''

  scope defaults: { format: :json } do
    resources :personas, except: [:new, :edit]
  end
end
