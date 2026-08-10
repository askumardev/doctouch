Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "super_admin/login" => "sessions#new", as: :super_admin_login
  post "super_admin/login" => "sessions#create"
  delete "super_admin/logout" => "sessions#destroy", as: :super_admin_logout

  namespace :super_admin do
    root to: "clinics#index"
    resources :clinics do
      resources :clinic_admins, only: %i[new create destroy]
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "landing#index"
end
