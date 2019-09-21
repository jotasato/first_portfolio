Rails.application.routes.draw do
 

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

# devise_for :admins, :controllers => {
#     :registrations => 'admins/registrations'
# }
  
# devise_for :users, :controllers => {
#     :registrations => 'users/registrations'
# }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  
  root "tops#new"
  
  get "top" => "tops#new"

  
    #アドミン側のルーティング
  
        namespace :admins do

          


        resources :admins

        resources :menus

        

        
        end
  




    # ユーザー側のルーティング
      scope module: :users do

        resources :menus, :except => [:edit]

        resources :mealrecords

        resources :graphs, :only => [:create]
        get "users/measurement" => "users#measurement", as: "measurement"
        resources :users do
          collection do
            patch :renew
          end
        end

        get 'users/objective/:id' => 'users#objective', as: "objective"
            # patch "users" => "users#renew" , as:"renew"
        get "users/quit/:id" => "users#quit", as: "quit"
        delete "users/quit/:id" => "users#clear", as: "clear"
      
        patch "users/measurement/:id" => "users#record", as: "record"
        get "users/result/:id" => "users#result", as: "result"
        get "my_mealrecord" => "users#usermealrecord" , as: "usermealrecord"
        get "users/graph/:id" => "users#graph", as: "graph"
        
        
      end
  end