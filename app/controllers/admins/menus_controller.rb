class Admins::MenusController < ApplicationController

  before_action :authenticate_admin!
    
    #メニュー一覧を表示
    def index
      @menus = Menu.all
    end
    #メニュー詳細を表示
    def show
      @menu = Menu.find(params[:id])
    end
    #新規メニュー登録ページを表示
    def new
      @menu = Menu.new
    end
    #新規メニュー作成
    def create
      @menu = Menu.new(menu_params)  
      @menu.save
      redirect_to admins_menu_path(@menu)
    end
    #メニューを削除する
    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to admins_menus_path 
    end

  private
    def menu_params
        params.require(:menu).permit(:menu_name, :menu_image_id, :calorie, :protein, :fat, :carbo)
    end
end