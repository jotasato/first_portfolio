class Admins::MenusController < ApplicationController
  def index
  end

  

  def show
    @menu = Menu.find(params[:id])


  end

  def new
    @menu = Menu.new
 
  end

  def create
    @menu = Menu.new(menu_params)  
    @menu.save
    redirect_to admins_menu_path(current_admin)
  end

  def update
  end

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