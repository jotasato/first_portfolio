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
   redirect_to admins_menu_path(@menu)
  
  
  end

  def update
  end
end


private
  def menu_params
    params.require(:menu).permit(:menu_name, :menu_image_id)
  end