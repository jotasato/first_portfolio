class Users::MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end
end


private
  def menu_params
    params.require(:menu).permit(:menu_image)
  end