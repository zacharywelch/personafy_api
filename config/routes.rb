Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :personas, except: [:new, :edit]
  end
end
