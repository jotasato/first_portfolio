Rails.application.routes.draw do
 
  devise_for :admins
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  
  root "tops#new"
  
  get "top" => "tops#new"

  
    #アドミン側のルーティング
  
       scope module: :admins do

        resources :admins

        resources :menus




      end
  




    # ユーザー側のルーティング
      scope module: :users do

        resources :menus, :except => [:edit]

        resources :users do
          collection do
            patch :renew
          end
        end

        get 'users/objective/:id' => 'users#objective', as: "objective"
            # patch "users" => "users#renew" , as:"renew"
        get "users/quit/:id" => "users#quit", as: "quit"
        delete "users/quit/:id" => "users#clear", as: "clear"
        get "users/menus/:id" => "menus#new", as: "mealrecord"
        get "users/measurement/:id" => "users#measurement", as: "measurement"
        patch "users/measurement/:id" => "users#record", as: "record"
        get "users/result/:id" => "users#result", as: "result"
        
        
      end
  end