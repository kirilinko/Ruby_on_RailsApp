Rails.application.routes.draw do
  get 'operations/index'
  get 'operations/ajouter'
  get 'operations/:id/modifier', to:"operations#modifier",  as: 'operation_modifier'

  root to: redirect('utilisateurs/index')

  get 'utilisateurs/index'
  post'utilisateurs/index' , to:"utilisateurs#connection"
  get 'utilisateurs/inscription' , to:"utilisateurs#inscription"
  get 'utilisateurs/profil'
  post 'utilisateurs/deconnexion', to:"utilisateurs#deconnexion", as: 'utilisateur_deconnexion'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :utilisateurs
  resources :operations
end
