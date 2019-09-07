Rails.application.routes.draw do
 
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  
  root "tops#new"
  
  get "top" => "tops#new"



  # ユーザー側のルーティング
  scope module: :users do

    resources :menus, :except => [:edit]

    resources :users




 

  end
end



