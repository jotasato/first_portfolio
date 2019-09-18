

class Users::MenusController < ApplicationController



  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    # buildはnewと同じ意味。アソシエーションしたままnewしたい時に使う。
    # 今回の場合は@menu.idが、@mealrecord.menu_idに代入される。
    # つまり
    @mealrecord = Mealrecord.new
    # @mealrecord.menu_id = @menu.id と同じ意味。
    # @mealrecord = @menu.mealrecords.build
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