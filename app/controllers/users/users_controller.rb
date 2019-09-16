class Users::UsersController < ApplicationController
def index
end

def show  
  @user = current_user
end

def new

end

def destroy
end

def create
end


def update  #ユーザー情報更新

  
        @user = current_user
    if @user.update(user_params) 
        flash[:notice] = "更新成功しました"
        redirect_to user_path(current_user) #redirectの場合はnotice
    else
        flash[:alert] ="更新失敗しました" #　renderの場合はalert
        render :edit  #editアクションを再度呼び出す
    end
end


def edit

    @user = current_user
  
end

def objective #目標入力編集ページを表示する
    @user = current_user
  


end


def renew #目標入力ページを更新する
     @user = current_user
     @user.update(user_params) 
     redirect_to user_path(current_user)
end


def quit #ユーザー退会フォームの表示
  @user = current_user

end


def clear  #ユーザー論理削除

  @user = current_user
  @user.destroy
  sign_out(current_user)
  redirect_to root_path

end

def measurement #測定ページを表示する
  @user = current_user
end    


def record #測定結果保存
  @user = current_user
  @user.maintain_calories(user_params, params[:momentum])
  @user.assign_attributes(user_params) #指定モデルの各カラムに値を入れる。ただし保存はまだしない。
  @user.save
  redirect_to result_path

 

end



def result #測定結果表示

  @user = current_user
  




end






  private
    def user_params
        params.require(:user).permit(:nickname, :postal_code, :address, :tel, :email, :objective, :height, :age, :weight, :gender, :result)
    end
  
  
  end