class ApplicationController < ActionController::Base

     before_action :configure_permitted_parameters, if: :devise_controller?
     
    private
    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
        if resource_or_scope.is_a?(Admin)
            admins_admin_path(current_admin)
        else
            root_path
        end
    end
    

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :admin_admin_user
            new_admin_admin_user_session_path
        else
            new_user_session_path

        end
    end
   

    # deviseではサインアップ時にメールアドレスとパスワードのみを受け取るようにストロングパラメーターで設定してあるので
    #キーを追加しても許可されません。サインアップ時に他情報も登録できるように許可する記述。
    def configure_permitted_parameters  
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :tel, :address, :postal_code])
    end
    
end
