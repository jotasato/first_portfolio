

class Users::MenusController < ApplicationController
  PER = 6 #ページングを表示する商品の数


  def index
    
    @menus = Menu.page(params[:page]).per(PER)
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