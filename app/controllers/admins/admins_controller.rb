class Admins::AdminsController < ApplicationController

  before_action :authenticate_admin!
    
    def index   #ユーザー一覧画面    
        @users = User.all
        @users = User.page(params[:page]).per(5) 
    end

    def show    #管理者トップ画面
    end

    def detail  #ユーザー詳細情報
        @user = User.find(params[:user_id])   
    end   
end

