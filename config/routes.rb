Rails.application.routes.draw do
  scope defaults: { format: :json } do
    resources :personas, except: [:new, :edit] do
      resources :behaviors, except: [:new, :edit], shallow: true
      resources :goals, except: [:new, :edit], shallow: true
    end
  end
end
