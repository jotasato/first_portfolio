Rails.application.routes.draw do
 

    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
    root "tops#new"
    
    get "top" => "tops#new"

    
      #アドミン側のルーティング
    
          namespace :admins do

            get "users/:user_id" => "admins#detail", as: "user"

            resources :admins

            resources :menus
            
          end


      # ユーザー側のルーティング
        scope module: :users do

            get "users/measurement" => "users#measurement", as: "measurement"
            resources :users do
              collection do
                patch :renew
              end
            end

            get 'users/objective/:id' => 'users#objective', as: "objective"
            get "users/quit/:id" => "users#quit", as: "quit"
            delete "users/quit/:id" => "users#clear", as: "clear"
          
            patch "users/measurement/:id" => "users#record", as: "record"
            get "users/result/:id" => "users#result", as: "result"
            get "my_mealrecord" => "users#usermealrecord" , as: "usermealrecord"
            get "users/graph/:id" => "users#graph", as: "graph"
            
            resources :menus, :except => [:edit]

            resources :mealrecords

            resources :graphs, :only => [:create] 
        end
end