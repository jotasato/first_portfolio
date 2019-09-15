class Users::RegistrationsController < Devise::RegistrationsController
    def after_sign_up_path_for(resource)
        measurement_path(current_user) #新規登録後の遷移先のパス設定
    end
  
    def after_inactive_sign_up_path_for(resource)
        measurement_path(current_user)#新規登録後の遷移先のパス設定
    end
end